part of 'task_editor_bloc.dart';

@freezed
sealed class TaskEditorState with _$TaskEditorState {
  const factory TaskEditorState({
    required final bool isNew,
    required final int id,
    required final Status<String> loadingState,
    required final bool isPlanned,
    required final bool isRepeated,
    required final String text,
    required final String? textError,
    required final bool isImageRequired,
    required final Duration time,
    required final DateTime date,
    required final int weekdays,
    required final List<Profile> executives,
    required final OperationStatus<String> uploadState,
    required final OperationStatus<String> deleteState,
  }) = _TaskEditorState;
}
