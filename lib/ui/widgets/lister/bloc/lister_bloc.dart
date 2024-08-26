import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../../api/database.dart';
import '../../../../api/entity/entity.dart';

part 'lister_bloc.freezed.dart';
part 'lister_event.dart';
part 'lister_state.dart';

abstract class ListerBloc<T extends Entity> extends Bloc<ListerEvent, ListerState<T>> {
  ListerBloc() : super(const ListerStateLoading()) {
    on<ListerEvent>(
      (final event, final emit) {
        return switch (event) {
          ListerEventLoadRequested() => _onLoadRequested(emit, event),
          ListerEventLoadAfterRequested() => _onLoadAfterRequested(emit, event),
          ListerEventDataUpdated() => onDataUpdated(emit, event),
        };
      },
      transformer: sequential(),
    );

    _itemsSubscription = db
        .channel(tableName)
        .onPostgresChanges(
          table: tableName,
          event: PostgresChangeEvent.all,
          callback: (final payload) => add(ListerEventDataUpdated(payload: payload)),
        )
        .subscribe();

    add(const ListerEventLoadRequested());
  }

  static const itemsPerLoad = 15;

  String get tableName;
  String get fieldNames;
  String get orderBy;
  bool get ascending;
  String get idFieldKey;
  List<T>? Function(List<Map<String, dynamic>> data) get converter;
  T Function(Map<String, dynamic> json) get fromJson;
  bool Function(T a, T b) get isAfter;

  RealtimeChannel? _itemsSubscription;

  bool _isFullyLoaded() {
    final currentState = state;
    if (currentState is! ListerStateData<T>) return false;

    return currentState.items.length == currentState.totalCount;
  }

  Future<void> _onLoadRequested(final Emitter<ListerState> emit, final ListerEventLoadRequested event) async {
    try {
      if (state is ListerStateError) {
        emit(const ListerStateLoading());
      }

      final count = await db.from(tableName).count();
      final items = await db.from(tableName).select(fieldNames).limit(itemsPerLoad).order(orderBy, ascending: ascending).withConverter(converter) ?? List.empty();

      emit(
        ListerStateData<T>(
          totalCount: count,
          items: items,
        ),
      );
    } on Exception catch (e) {
      emit(ListerStateError(error: e.toString()));
    }
  }

  Future<void> _onLoadAfterRequested(final Emitter<ListerState> emit, final ListerEventLoadAfterRequested event) async {
    try {
      final currentState = state;
      if (currentState is! ListerStateData<T>) return;
      if (event.index < currentState.items.length) return;
      if (currentState.items.length >= currentState.totalCount) return;

      final endIndex = min<int>((currentState.items.length - 1) + itemsPerLoad, currentState.totalCount - 1);
      final items = await db.from(tableName).select(fieldNames).range(currentState.items.length, endIndex).order(orderBy, ascending: ascending).withConverter(converter) ?? List.empty();

      emit(
        currentState.copyWith(
          items: [
            ...currentState.items,
            ...items,
          ],
        ),
      );
    } on Exception catch (e) {
      emit(ListerStateError(error: e.toString()));
    }
  }

  Future<void> onDataUpdated(final Emitter<ListerState> emit, final ListerEventDataUpdated event) async {
    final currentState = state;
    if (currentState is! ListerStateData<T>) return;

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

  ListerStateData<T> _insert(final ListerStateData<T> currentState, final PostgresChangePayload payload) {
    final newItems = _insertIntoList(payload.newRecord, currentState.items);

    return newItems != null
        ? currentState.copyWith(
            totalCount: currentState.totalCount + 1,
            items: newItems,
          )
        : currentState.copyWith(
            totalCount: currentState.totalCount + 1,
          );
  }

  ListerStateData<T>? _update(final ListerStateData<T> currentState, final PostgresChangePayload payload) {
    final newItems = _insertIntoList(payload.newRecord, _deleteFromList(payload.oldRecord, currentState.items));

    return newItems != null
        ? currentState.copyWith(
            items: newItems,
          )
        : null;
  }

  ListerStateData<T> _delete(final ListerStateData<T> currentState, final PostgresChangePayload payload) {
    final newItems = _deleteFromList(payload.oldRecord, currentState.items);

    return newItems != null
        ? currentState.copyWith(
            totalCount: currentState.totalCount - 1,
            items: newItems,
          )
        : currentState.copyWith(
            totalCount: currentState.totalCount - 1,
          );
  }

  List<T>? _insertIntoList(final Map<String, dynamic> newRecord, final List<T>? items) {
    if (items == null) return null;

    final newItem = fromJson(newRecord);

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
    _itemsSubscription?.unsubscribe();
    return super.close();
  }
}
