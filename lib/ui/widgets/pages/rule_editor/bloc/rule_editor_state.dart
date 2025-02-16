part of 'rule_editor_bloc.dart';

@freezed
sealed class RuleEditorState with _$RuleEditorState {
  const factory RuleEditorState.create({
    @Default(WordsRule(id: -1, color: Colors.red, words: {})) final Rule rule,
    final String? descriptionError,
    @Default(OperationStatusInitial())
    final OperationStatus<String> uploadState,
  }) = RuleEditorStateCreate;

  const factory RuleEditorState.edit({
    required final int id,
    @Default(StatusOfLoading())
    final StatusOf<RuleEditorStateEditState, String> editState,
  }) = RuleEditorStateEdit;
}

@freezed
class RuleEditorStateEditState with _$RuleEditorStateEditState {
  const factory RuleEditorStateEditState({
    required final Rule rule,
    final String? descriptionError,
    @Default(OperationStatusInitial())
    final OperationStatus<String> uploadState,
    @Default(OperationStatusInitial())
    final OperationStatus<String> deleteState,
  }) = _RuleEditorStateEditState;
}
