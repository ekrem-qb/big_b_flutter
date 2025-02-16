part of 'profile_picker_bloc.dart';

@freezed
sealed class ProfilePickerEvent with _$ProfilePickerEvent {
  const factory ProfilePickerEvent.loadRequested() =
      ProfilePickerEventLoadRequested;
  const factory ProfilePickerEvent.selected(final int index) =
      ProfilePickerEventSelected;
  const factory ProfilePickerEvent.deselected(final int index) =
      ProfilePickerEventDeselected;
}
