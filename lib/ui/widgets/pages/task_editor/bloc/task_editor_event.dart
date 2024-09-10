part of 'task_editor_bloc.dart';

@freezed
sealed class TaskEditorEvent with _$TaskEditorEvent {
  const factory TaskEditorEvent.loadRequested() = TaskEditorEventLoadRequested;
  const factory TaskEditorEvent.textChanged(final String text) = TaskEditorEventTextChanged;
  const factory TaskEditorEvent.isImageRequiredChanged({required final bool value}) = TaskEditorEventIsImageRequiredChanged;
  const factory TaskEditorEvent.timeChanged(final Duration time) = TaskEditorEventTimeChanged;
  const factory TaskEditorEvent.dateChanged(final DateTime date) = TaskEditorEventDateChanged;
  const factory TaskEditorEvent.weekdayToggled({required final int day, required final bool value}) = TaskEditorEventWeekdayToggled;
  const factory TaskEditorEvent.executivesAdded(final List<Profile> executives) = TaskEditorEventExecutivesAdded;
  const factory TaskEditorEvent.executiveRemoved(final int index) = TaskEditorEventExecutiveRemoved;
  const factory TaskEditorEvent.saveRequested() = TaskEditorEventSaveRequested;
  const factory TaskEditorEvent.deleteRequested() = TaskEditorEventDeleteRequested;
}
