part of 'rule_editor_bloc.dart';

@freezed
sealed class RuleEditorState with _$RuleEditorState {
  const factory RuleEditorState.create({
    @Default(
      Rule(
        id: -1,
        description: '',
        details: '',
        color: Colors.red,
      ),
    )
    final Rule rule,
    final String? descriptionError,
    @Default(OperationStatusInitial()) final OperationStatus uploadState,
  }) = RuleEditorStateCreate;

  const factory RuleEditorState.edit({
    required final int id,
    @Default(StatusOfLoading()) final StatusOf<RuleEditorStateEditState> editState,
  }) = RuleEditorStateEdit;
}

@freezed
class RuleEditorStateEditState with _$RuleEditorStateEditState {
  const factory RuleEditorStateEditState({
    required final Rule rule,
    final String? descriptionError,
    @Default(OperationStatusInitial()) final OperationStatus uploadState,
    @Default(OperationStatusInitial()) final OperationStatus deleteState,
  }) = _RuleEditorStateEditState;
}
