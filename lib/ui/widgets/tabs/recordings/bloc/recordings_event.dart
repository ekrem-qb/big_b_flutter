part of 'recordings_bloc.dart';

@freezed
sealed class RecordingsEvent with _$RecordingsEvent {
  const factory RecordingsEvent.loadRequested() = RecordingsEventLoadRequested;
  const factory RecordingsEvent.dataUpdated({required final PostgresChangePayload payload}) = _RecordingsEventDataUpdated;
}
