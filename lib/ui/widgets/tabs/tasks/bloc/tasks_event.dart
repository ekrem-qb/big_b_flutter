part of 'tasks_bloc.dart';

@freezed
sealed class TasksEvent with _$TasksEvent {
  const factory TasksEvent.loadRequested() = TasksEventLoadRequested;
}
