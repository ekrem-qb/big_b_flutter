part of 'task_viewer_bloc.dart';

@freezed
class TaskViewerState with _$TaskViewerState {
  const factory TaskViewerState({
    required final int id,
    required final StatusOf<Task, String> task,
    @Default(OperationStatusInitial())
    final OperationStatus<String> deleteState,
  }) = _TaskViewerState;
}
