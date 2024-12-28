import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../../api/database.dart';
import '../../../../api/entity/entity.dart';
import '../../../../api/entity/join_table.dart';
import '../../../../extensions/hash_generator.dart';
import '../../../entity/status.dart';

part 'lister_bloc.freezed.dart';
part 'lister_event.dart';
part 'lister_state.dart';

typedef ListerFilters<E> = (
  PostgrestFilterBuilder<T> Function<T>(PostgrestFilterBuilder<T> query),
  bool Function(E item),
);

abstract class ListerBloc<T extends Entity> extends Bloc<ListerEvent, StatusOf<ListerState<T>, String>> {
  ListerBloc({
    final List<T>? cachedItems,
  }) : super(
          cachedItems != null
              ? StatusOfData(
                  ListerState<T>(
                    totalCount: cachedItems.length,
                    items: cachedItems,
                  ),
                )
              : const StatusOfLoading(),
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
          .channel(generateHash())
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
              .channel(generateHash())
              .onPostgresChanges(
                table: joinTable.tableName,
                event: PostgresChangeEvent.update,
                callback: (final payload) => add(const ListerEventLoadRequested()),
              )
              .subscribe();
        },
      ),
    ];

    if (state is StatusOfLoading) {
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
    switch (state) {
      case StatusOfData(
          :final data,
        ):
        return data.items.length == data.totalCount;
      default:
        return false;
    }
  }

  Future<void> _onLoadRequested(final Emitter<StatusOf<ListerState<T>, String>> emit, final ListerEventLoadRequested event) async {
    try {
      if (state is StatusOfError) {
        emit(const StatusOfLoading());
      }

      final countQuery = db.from(tableName).count();
      final count = await (filters != null ? filters!.$1(countQuery) : countQuery);
      final endIndex = max(
        itemsPerLoad,
        switch (state) {
          StatusOfData(
            :final data,
          ) =>
            data.items.length,
          _ => 0
        },
      );
      final query = db.from(tableName).select(fieldNames);
      final items = await (filters != null ? filters!.$1(query) : query).limit(endIndex).order(orderBy, ascending: ascending).withConverter(converter) ?? const [];

      emit(
        StatusOfData(
          ListerState(
            totalCount: count,
            items: items,
          ),
        ),
      );
    } catch (e) {
      emit(StatusOfError(e.toString()));
    }
  }

  Future<void> _onLoadAfterRequested(final Emitter<StatusOf<ListerState<T>, String>> emit, final ListerEventLoadAfterRequested event) async {
    try {
      switch (state) {
        case StatusOfData(
            :final data,
            :final copyWith,
          ):
          if (event.index < data.items.length) return;
          if (data.items.length >= data.totalCount) return;

          final endIndex = min((data.items.length - 1) + itemsPerLoad, data.totalCount - 1);
          final query = db.from(tableName).select(fieldNames);
          final items = await (filters != null ? filters!.$1(query) : query).range(data.items.length, endIndex).order(orderBy, ascending: ascending).withConverter(converter) ?? const [];

          emit(
            copyWith(
              data: data.copyWith(
                items: [
                  ...data.items,
                  ...items,
                ],
              ),
            ),
          );
        default:
          return;
      }
    } catch (e) {
      emit(StatusOfError(e.toString()));
    }
  }

  Future<void> _onDataUpdated(final Emitter<StatusOf<ListerState<T>, String>> emit, final _ListerEventDataUpdated event) async {
    final currentState = state;
    switch (currentState) {
      case StatusOfData():
        final newState = switch (event.payload.eventType) {
          PostgresChangeEvent.insert => _insert(currentState, event.payload),
          PostgresChangeEvent.update => _update(currentState, event.payload),
          PostgresChangeEvent.delete => _delete(currentState, event.payload),
          _ => null,
        };

        if (newState != null) {
          emit(newState);
        }
      default:
        return;
    }
  }

  StatusOfData<ListerState<T>, String>? _insert(final StatusOfData<ListerState<T>, String> currentState, final PostgresChangePayload payload) {
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

  StatusOfData<ListerState<T>, String>? _update(final StatusOfData<ListerState<T>, String> currentState, final PostgresChangePayload payload) {
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

  StatusOfData<ListerState<T>, String> _delete(final StatusOfData<ListerState<T>, String> currentState, final PostgresChangePayload payload) {
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
