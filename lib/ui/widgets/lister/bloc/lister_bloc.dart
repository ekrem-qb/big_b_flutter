import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../../api/database.dart';
import '../../../../api/entity/entity.dart';
import '../../../../api/entity/join_table.dart';
import '../../../entity/status.dart';

part 'lister_bloc.freezed.dart';
part 'lister_event.dart';
part 'lister_state.dart';

typedef ListerFilters<E> = (
  PostgrestFilterBuilder<T> Function<T>(PostgrestFilterBuilder<T> query),
  bool Function(E item),
);

abstract class ListerBloc<T extends Entity> extends Bloc<ListerEvent, StatusOf<ListerState<T>>> {
  ListerBloc({
    final List<T>? cachedItems,
  }) : super(
          cachedItems != null
              ? StatusOfData<ListerState<T>>(
                  ListerState<T>(
                    totalCount: cachedItems.length,
                    items: cachedItems,
                  ),
                )
              : StatusOfLoading<ListerState<T>>(),
        ) {
    on<ListerEvent>(
      (final event, final emit) {
        return switch (event) {
          ListerEventLoadRequested() => _onLoadRequested(emit, event),
          ListerEventLoadAfterRequested() => _onLoadAfterRequested(emit, event),
          _ListerEventDataUpdated() => _onDataUpdated(emit, event),
        };
      },
      transformer: sequential(),
    );

    _dbSubscriptions = [
      db
          .channel(tableName)
          .onPostgresChanges(
            table: tableName,
            event: PostgresChangeEvent.all,
            callback: (final payload) => add(
              joinTables.isEmpty ? _ListerEventDataUpdated(payload: payload) : const ListerEventLoadRequested(),
            ),
          )
          .subscribe(),
      ...joinTables.map(
        (final joinTable) {
          return db
              .channel('${tableName}_${joinTable.tableName}')
              .onPostgresChanges(
                table: joinTable.tableName,
                event: PostgresChangeEvent.update,
                callback: (final payload) => add(const ListerEventLoadRequested()),
              )
              .subscribe();
        },
      ),
    ];

    if (state is StatusOfLoading<ListerState<T>>) {
      add(const ListerEventLoadRequested());
    }
  }

  static const itemsPerLoad = 15;

  String get tableName;
  List<JoinTable> get joinTables;
  String get fieldNames;
  String get orderBy;
  bool get ascending;
  String get idFieldKey;
  List<T>? Function(List<Map<String, dynamic>> data) get converter;
  T Function(Map<String, dynamic> json) get fromJson;
  bool Function(T a, T b) get isAfter;
  ListerFilters<T>? get filters;

  List<RealtimeChannel>? _dbSubscriptions;

  bool _isFullyLoaded() {
    final currentState = state;
    if (currentState is! StatusOfData<ListerState<T>>) return false;

    return currentState.data.items.length == currentState.data.totalCount;
  }

  Future<void> _onLoadRequested(final Emitter<StatusOf<ListerState<T>>> emit, final ListerEventLoadRequested event) async {
    try {
      if (state is StatusOfError<ListerState<T>>) {
        emit(StatusOfLoading<ListerState<T>>());
      }

      final countQuery = db.from(tableName).count();
      final count = await (filters != null ? filters!.$1(countQuery) : countQuery);
      final endIndex = max(
        itemsPerLoad,
        switch (state) {
          StatusOfData<ListerState<T>>(
            :final data,
          ) =>
            data.items.length,
          _ => 0
        },
      );
      final query = db.from(tableName).select(fieldNames);
      final items = await (filters != null ? filters!.$1(query) : query).limit(endIndex).order(orderBy, ascending: ascending).withConverter(converter) ?? const [];

      emit(
        StatusOfData<ListerState<T>>(
          ListerState(
            totalCount: count,
            items: items,
          ),
        ),
      );
    } catch (e) {
      emit(StatusOfError<ListerState<T>>(e.toString()));
    }
  }

  Future<void> _onLoadAfterRequested(final Emitter<StatusOf<ListerState<T>>> emit, final ListerEventLoadAfterRequested event) async {
    try {
      final currentState = state;
      if (currentState is! StatusOfData<ListerState<T>>) return;
      if (event.index < currentState.data.items.length) return;
      if (currentState.data.items.length >= currentState.data.totalCount) return;

      final endIndex = min((currentState.data.items.length - 1) + itemsPerLoad, currentState.data.totalCount - 1);
      final query = db.from(tableName).select(fieldNames);
      final items = await (filters != null ? filters!.$1(query) : query).range(currentState.data.items.length, endIndex).order(orderBy, ascending: ascending).withConverter(converter) ?? const [];

      emit(
        currentState.copyWith(
          data: currentState.data.copyWith(
            items: [
              ...currentState.data.items,
              ...items,
            ],
          ),
        ),
      );
    } catch (e) {
      emit(StatusOfError<ListerState<T>>(e.toString()));
    }
  }

  Future<void> _onDataUpdated(final Emitter<StatusOf<ListerState<T>>> emit, final _ListerEventDataUpdated event) async {
    final currentState = state;
    if (currentState is! StatusOfData<ListerState<T>>) return;

    final newState = switch (event.payload.eventType) {
      PostgresChangeEvent.insert => _insert(currentState, event.payload),
      PostgresChangeEvent.update => _update(currentState, event.payload),
      PostgresChangeEvent.delete => _delete(currentState, event.payload),
      _ => null,
    };

    if (newState != null) {
      emit(newState);
    }
  }

  StatusOfData<ListerState<T>>? _insert(final StatusOfData<ListerState<T>> currentState, final PostgresChangePayload payload) {
    final newItem = fromJson(payload.newRecord);
    final newItems = filters != null && !filters!.$2(newItem) ? null : _insertIntoList(newItem, currentState.data.items);

    return StatusOfData(
      newItems != null
          ? currentState.data.copyWith(
              totalCount: currentState.data.totalCount + 1,
              items: newItems,
            )
          : currentState.data.copyWith(
              totalCount: currentState.data.totalCount + 1,
            ),
    );
  }

  StatusOfData<ListerState<T>>? _update(final StatusOfData<ListerState<T>> currentState, final PostgresChangePayload payload) {
    final newItem = fromJson(payload.newRecord);
    final List<T>? newItems;
    final int? newCount;

    if (filters != null) {
      final currentCount = currentState.data.totalCount;
      if (filters!.$2(newItem)) {
        final itemsWithoutOldRecord = _deleteFromList(payload.oldRecord, currentState.data.items);
        newItems = _insertIntoList(newItem, itemsWithoutOldRecord ?? currentState.data.items);
        if (newItems != null && currentCount < newItems.length) {
          newCount = currentCount + 1;
        } else {
          newCount = null;
        }
      } else {
        newItems = _deleteFromList(payload.oldRecord, currentState.data.items);
        if (newItems != null) {
          newCount = currentCount - 1;
        } else {
          newCount = null;
        }
      }
    } else {
      final itemsWithoutOldRecord = _deleteFromList(payload.oldRecord, currentState.data.items);
      newItems = _insertIntoList(newItem, itemsWithoutOldRecord);
      newCount = null;
    }

    return newItems != null
        ? StatusOfData(
            newCount != null
                ? currentState.data.copyWith(
                    items: newItems,
                    totalCount: newCount,
                  )
                : currentState.data.copyWith(
                    items: newItems,
                  ),
          )
        : null;
  }

  StatusOfData<ListerState<T>> _delete(final StatusOfData<ListerState<T>> currentState, final PostgresChangePayload payload) {
    final newItems = _deleteFromList(payload.oldRecord, currentState.data.items);

    return StatusOfData(
      newItems != null
          ? currentState.data.copyWith(
              totalCount: currentState.data.totalCount - 1,
              items: newItems,
            )
          : currentState.data.copyWith(
              totalCount: currentState.data.totalCount - 1,
            ),
    );
  }

  List<T>? _insertIntoList(final T newItem, final List<T>? items) {
    if (items == null) return null;

    for (var i = 0; i < items.length; i++) {
      if (isAfter(newItem, items[i])) {
        return [
          ...items.sublist(0, i),
          newItem,
          ...items.sublist(i),
        ];
      }
    }

    return _isFullyLoaded()
        ? [
            ...items,
            newItem,
          ]
        : null;
  }

  List<T>? _deleteFromList(final Map<String, dynamic> oldRecord, final List<T> items) {
    final id = oldRecord[idFieldKey];

    for (var i = 0; i < items.length; i++) {
      if (id == items[i].id) {
        return [
          ...items.sublist(0, i),
          ...items.sublist(i + 1),
        ];
      }
    }

    return null;
  }

  @override
  Future<void> close() {
    final dbSubscriptions = _dbSubscriptions;
    if (dbSubscriptions != null) {
      for (var i = 0; i < dbSubscriptions.length; i++) {
        dbSubscriptions[i].unsubscribe();
      }
    }
    return super.close();
  }
}
