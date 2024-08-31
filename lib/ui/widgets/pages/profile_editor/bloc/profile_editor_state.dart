part of 'profile_editor_bloc.dart';

@freezed
sealed class ProfileEditorState with _$ProfileEditorState {
  const factory ProfileEditorState.edit({
    required final String uid,
    required final String name,
    required final String login,
    required final Role role,
    final String? nameError,
    @Default(OperationStatusInitial()) final OperationStatus uploadState,
    @Default(OperationStatusInitial()) final OperationStatus deleteState,
  }) = ProfileEditorStateEdit;

  const factory ProfileEditorState.create({
    @Default('') final String name,
    final String? nameError,
    @Default('') final String login,
    final String? loginError,
    @Default(Role.employee) final Role role,
    @Default('') final String password,
    final String? passwordError,
    @Default(false) final bool isPasswordVisible,
    @Default(OperationStatusInitial()) final OperationStatus uploadState,
  }) = ProfileEditorStateCreate;

  const factory ProfileEditorState.loading({
    required final String uid,
  }) = ProfileEditorStateLoading;

  const factory ProfileEditorState.error({
    required final String error,
  }) = ProfileEditorStateError;
}
