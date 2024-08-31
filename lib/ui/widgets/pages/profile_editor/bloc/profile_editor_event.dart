part of 'profile_editor_bloc.dart';

@freezed
sealed class ProfileEditorEvent with _$ProfileEditorEvent {
  const factory ProfileEditorEvent.loadRequested() = ProfileEditorEventLoadRequested;
  const factory ProfileEditorEvent.nameChanged(final String value) = ProfileEditorEventNameChanged;
  const factory ProfileEditorEvent.loginChanged(final String value) = ProfileEditorEventLoginChanged;
  const factory ProfileEditorEvent.passwordChanged(final String value) = ProfileEditorEventPasswordChanged;
  const factory ProfileEditorEvent.passwordVisibilityToggled() = ProfileEditorEventPasswordVisibilityToggled;
  const factory ProfileEditorEvent.roleChanged(final Role value) = ProfileEditorEventRoleChanged;
  const factory ProfileEditorEvent.saveRequested() = ProfileEditorEventSaveRequested;
  const factory ProfileEditorEvent.deleteDialogOpened() = ProfileEditorEventDeleteDialogOpened;
  const factory ProfileEditorEvent.deleteDialogClosed({required final bool isDeleted}) = ProfileEditorEventDeleteDialogClosed;
}
