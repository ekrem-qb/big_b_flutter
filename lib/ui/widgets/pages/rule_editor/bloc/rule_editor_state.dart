part of 'rule_editor_bloc.dart';

@freezed
sealed class RuleEditorState with _$RuleEditorState {
  const factory RuleEditorState.create({
    @Default('') final String description,
    final String? descriptionError,
    @Default('') final String details,
    @Default(Colors.red) final Color color,
    @Default(StatusInitial()) final Status uploadState,
  }) = RuleEditorStateCreate;

  const factory RuleEditorState.edit({
    required final int id,
    @Default(StatusOfLoading()) final StatusOf<RuleEditorStateEditState> editState,
  }) = RuleEditorStateEdit;
}

@freezed
class RuleEditorStateEditState with _$RuleEditorStateEditState {
  const factory RuleEditorStateEditState({
    required final String description,
    required final String details,
    required final Color color,
    final String? descriptionError,
    @Default(StatusInitial()) final Status uploadState,
    @Default(StatusInitial()) final Status deleteState,
  }) = _RuleEditorStateEditState;
}
