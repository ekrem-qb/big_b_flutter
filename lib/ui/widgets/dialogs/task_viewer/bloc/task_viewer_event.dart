part of 'task_viewer_bloc.dart';

@freezed
sealed class TaskViewerEvent with _$TaskViewerEvent {
  const factory TaskViewerEvent.loadRequested() = TaskViewerEventLoadRequested;
  const factory TaskViewerEvent.deleteRequested() = TaskViewerEventDeleteRequested;
}
