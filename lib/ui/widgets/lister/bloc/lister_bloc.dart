import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../../api/database.dart';
import '../../../../api/entity/entity.dart';

part 'lister_bloc.freezed.dart';
part 'lister_event.dart';
part 'lister_state.dart';

abstract class ListerBloc<T extends Entity> extends Bloc<ListerEvent, ListerState<T>> {
  ListerBloc() : super(const ListerStateLoading()) {
    on<ListerEvent>((final event, final emit) {
      return switch (event) {
        ListerEventLoadRequested() => _onLoadRequested(emit, event),
        _ListerEventDataUpdated() => _onDataUpdated(emit, event),
      };
    });

    _itemsSubscription = db
        .channel(tableName)
        .onPostgresChanges(
          table: tableName,
          event: PostgresChangeEvent.all,
          callback: (final payload) => add(_ListerEventDataUpdated(payload: payload)),
        )
        .subscribe();

    add(const ListerEventLoadRequested());
  }

  String get tableName;
  String get fieldNames;
  String get orderBy;
  bool get ascending;
  String get idFieldKey;
  List<T>? Function(List<Map<String, dynamic>> data) get converter;
  T Function(Map<String, dynamic> json) get fromJson;
  bool Function(T a, T b) get isAfter;

  RealtimeChannel? _itemsSubscription;

  Future<void> _onLoadRequested(final Emitter<ListerState> emit, final ListerEventLoadRequested event) async {
    try {
      if (state is ListerStateError) {
        emit(const ListerStateLoading());
      }

      final items = await db.from(tableName).select(fieldNames).order(orderBy, ascending: ascending).withConverter(converter) ?? List.empty();
      emit(ListerStateData<T>(items: items));
    } on Exception catch (e) {
      emit(ListerStateError(error: e.toString()));
    }
  }

  Future<void> _onDataUpdated(final Emitter<ListerState> emit, final _ListerEventDataUpdated event) async {
    final currentState = state;
    if (currentState is! ListerStateData<T>) return;

    final newItems = switch (event.payload.eventType) {
      PostgresChangeEvent.insert => _insert(fromJson(event.payload.newRecord), currentState.items),
      PostgresChangeEvent.update => _insert(fromJson(event.payload.newRecord), _delete(event.payload.oldRecord[idFieldKey], currentState.items) ?? currentState.items),
      PostgresChangeEvent.delete => _delete(event.payload.oldRecord[idFieldKey], currentState.items),
      _ => null,
    };

    if (newItems != null) {
      emit(currentState.copyWith(items: newItems));
    }
  }

  List<T> _insert(final T newItem, final List<T> items) {
    for (var i = 0; i < items.length; i++) {
      if (isAfter(newItem, items[i])) {
        return [
          ...items.sublist(0, i),
          newItem,
          ...items.sublist(i),
        ];
      }
    }

    return [
      ...items,
      newItem,
    ];
  }

  List<T>? _delete(final Object id, final List<T> items) {
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
