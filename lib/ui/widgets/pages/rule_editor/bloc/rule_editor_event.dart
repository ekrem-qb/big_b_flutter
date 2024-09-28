part of 'rule_editor_bloc.dart';

@freezed
sealed class RuleEditorEvent with _$RuleEditorEvent {
  const factory RuleEditorEvent.loadRequested() = RuleEditorEventLoadRequested;
  const factory RuleEditorEvent.typeChanged(final Rule value) = RuleEditorEventTypeChanged;
  const factory RuleEditorEvent.wordsAdded(final Iterable<String> value) = RuleEditorEventWordsAdded;
  const factory RuleEditorEvent.wordRemoved(final String value) = RuleEditorEventWordRemoved;
  const factory RuleEditorEvent.descriptionChanged(final String value) = RuleEditorEventDescriptionChanged;
  const factory RuleEditorEvent.detailsChanged(final String value) = RuleEditorEventDetailsChanged;
  const factory RuleEditorEvent.colorChanged(final Color value) = RuleEditorEventColorChanged;
  const factory RuleEditorEvent.saveRequested() = RuleEditorEventSaveRequested;
  const factory RuleEditorEvent.deleteRequested() = RuleEditorEventDeleteRequested;
}
