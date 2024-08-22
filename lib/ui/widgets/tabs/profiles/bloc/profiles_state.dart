part of 'profiles_bloc.dart';

@freezed
sealed class ProfilesState with _$ProfilesState {
  const factory ProfilesState.data({
    required final List<Profile> profiles,
  }) = ProfilesStateData;

  const factory ProfilesState.loading() = ProfilesStateLoading;

  const factory ProfilesState.error({
    required final String error,
  }) = ProfilesStateError;
}
