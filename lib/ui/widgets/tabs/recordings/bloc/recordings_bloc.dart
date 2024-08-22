import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../../api/database.dart';
import '../../../../../api/entity/recording/recording.dart';

part 'recordings_bloc.freezed.dart';
part 'recordings_event.dart';
part 'recordings_state.dart';

class RecordingsBloc extends Bloc<RecordingsEvent, RecordingsState> {
  RecordingsBloc() : super(const RecordingsStateLoading()) {
    on<RecordingsEvent>((final event, final emit) {
      return switch (event) {
        RecordingsEventLoadRequested() => _onLoadRequested(emit, event),
        _RecordingsEventDataUpdated() => _onDataUpdated(emit, event),
      };
    });

    _recordingsSubscriptions = [
      db
          .channel(Recording.tableName)
          .onPostgresChanges(
            table: Recording.tableName,
            event: PostgresChangeEvent.all,
            callback: (final payload) => add(_RecordingsEventDataUpdated(payload: payload)),
          )
          .subscribe(),
    ];

    add(const RecordingsEventLoadRequested());
  }

  late final List<RealtimeChannel> _recordingsSubscriptions;

  Future<void> _onLoadRequested(final Emitter<RecordingsState> emit, final RecordingsEventLoadRequested event) async {
    try {
      if (state is! RecordingsStateLoading) {
        emit(const RecordingsStateLoading());
      }

      await Future.delayed(const Duration(seconds: 1));

      final recordings = await db.from(Recording.tableName).select(Recording.fieldNames).order($RecordingImplJsonKeys.createdAt).withConverter(Recording.converter) ?? List.empty();
      emit(RecordingsStateData(recordings: recordings));
    } on Exception catch (e) {
      emit(RecordingsStateError(error: e.toString()));
    }
  }

  Future<void> _onDataUpdated(final Emitter<RecordingsState> emit, final _RecordingsEventDataUpdated event) async {
    final currentState = state;
    if (currentState is! RecordingsStateData) return;

    final newRecordings = switch (event.payload.eventType) {
      PostgresChangeEvent.insert => _insert(Recording.fromJson(event.payload.newRecord), currentState.recordings),
      PostgresChangeEvent.update => _insert(Recording.fromJson(event.payload.newRecord), _delete(event.payload.oldRecord[$RecordingImplJsonKeys.id], currentState.recordings) ?? currentState.recordings),
      PostgresChangeEvent.delete => _delete(event.payload.oldRecord[$RecordingImplJsonKeys.id], currentState.recordings),
      _ => null,
    };

    if (newRecordings != null) {
      emit(currentState.copyWith(recordings: newRecordings));
    }
  }

  List<Recording> _insert(final Recording newRecording, final List<Recording> recordings) {
    for (var i = 0; i < recordings.length; i++) {
      if (newRecording.createdAt.isAfter(recordings[i].createdAt)) {
        return [
          ...recordings.sublist(0, i),
          newRecording,
          ...recordings.sublist(i),
        ];
      }
    }

    return [
      ...recordings,
      newRecording,
    ];
  }

  List<Recording>? _delete(final int id, final List<Recording> recordings) {
    for (var i = 0; i < recordings.length; i++) {
      if (id == recordings[i].id) {
        return [
          ...recordings.sublist(0, i),
          ...recordings.sublist(i + 1),
        ];
      }
    }

    return null;
  }

  @override
  Future<void> close() {
    for (var i = 0; i < _recordingsSubscriptions.length; i++) {
      _recordingsSubscriptions[i].unsubscribe();
    }
    return super.close();
  }
}
