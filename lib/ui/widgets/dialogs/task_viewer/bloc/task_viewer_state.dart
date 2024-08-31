part of 'task_viewer_bloc.dart';

@freezed
class TaskViewerState with _$TaskViewerState {
  const factory TaskViewerState({
    required final int id,
    required final StatusOf<Task> task,
    @Default(OperationStatusInitial()) final OperationStatus deleteState,
  }) = _TaskViewerState;
}
