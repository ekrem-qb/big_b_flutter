part of 'rule_editor_bloc.dart';

@freezed
sealed class RuleEditorEvent with _$RuleEditorEvent {
  const factory RuleEditorEvent.loadRequested() = RuleEditorEventLoadRequested;
  const factory RuleEditorEvent.descriptionChanged(final String value) = RuleEditorEventDescriptionChanged;
  const factory RuleEditorEvent.detailsChanged(final String value) = RuleEditorEventDetailsChanged;
  const factory RuleEditorEvent.colorChanged(final Color value) = RuleEditorEventColorChanged;
  const factory RuleEditorEvent.saveRequested() = RuleEditorEventSaveRequested;
  const factory RuleEditorEvent.deleteDialogOpened() = RuleEditorEventDeleteDialogOpened;
  const factory RuleEditorEvent.deleteDialogClosed({required final bool isDeleted}) = RuleEditorEventDeleteDialogClosed;
}
