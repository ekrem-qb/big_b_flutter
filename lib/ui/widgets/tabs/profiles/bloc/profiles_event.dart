part of 'profiles_bloc.dart';

@freezed
sealed class ProfilesEvent with _$ProfilesEvent {
  const factory ProfilesEvent.loadRequested() = ProfilesEventLoadRequested;
  const factory ProfilesEvent.dataUpdated({required final PostgresChangePayload payload}) = _ProfilesEventDataUpdated;
}
