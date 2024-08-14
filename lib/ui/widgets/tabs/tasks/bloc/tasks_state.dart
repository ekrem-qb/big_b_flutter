part of 'tasks_bloc.dart';

@freezed
sealed class TasksState with _$TasksState {
  const factory TasksState.data({
    required final List<Task> tasks,
  }) = TasksStateData;

  const factory TasksState.loading() = TasksStateLoading;

  const factory TasksState.error({
    required final String error,
  }) = TasksStateError;
}
