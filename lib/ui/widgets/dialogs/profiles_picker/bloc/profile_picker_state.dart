part of 'profile_picker_bloc.dart';

@freezed
sealed class ProfilePickerState with _$ProfilePickerState {
  const factory ProfilePickerState({
    required final List<Profile> excluded,
    @Default(StatusOfLoading()) final StatusOf<List<Profile>> all,
    @Default([]) final List<Profile> selected,
  }) = _ProfilePickerState;
}
