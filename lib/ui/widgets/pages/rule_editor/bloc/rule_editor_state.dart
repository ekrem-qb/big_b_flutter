part of 'rule_editor_bloc.dart';

@freezed
sealed class RuleEditorState with _$RuleEditorState {
  const factory RuleEditorState.edit({
    required final int id,
    required final String description,
    required final String? details,
    required final Color color,
    final String? descriptionError,
    @Default(StatusInitial()) final Status uploadState,
    @Default(StatusInitial()) final Status deleteState,
  }) = RuleEditorStateEdit;

  const factory RuleEditorState.create({
    @Default('') final String description,
    final String? descriptionError,
    @Default('') final String? details,
    @Default(Colors.red) final Color color,
    @Default(StatusInitial()) final Status uploadState,
  }) = RuleEditorStateCreate;

  const factory RuleEditorState.loading({
    required final int id,
  }) = RuleEditorStateLoading;

  const factory RuleEditorState.error({
    required final String error,
  }) = RuleEditorStateError;
}

@freezed
sealed class Status with _$Status {
  const factory Status.initial() = StatusInitial;
  const factory Status.inProgress() = StatusInProgress;
  const factory Status.error({
    required final String error,
  }) = StatusError;
  const factory Status.completed() = StatusCompleted;
}
