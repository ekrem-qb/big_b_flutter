part of 'lister_bloc.dart';

@freezed
sealed class ListerEvent with _$ListerEvent {
  const factory ListerEvent.loadRequested() = ListerEventLoadRequested;
  const factory ListerEvent.loadAfterRequested(final int index) = ListerEventLoadAfterRequested;
  const factory ListerEvent.dataUpdated({required final PostgresChangePayload payload}) = ListerEventDataUpdated;
}
