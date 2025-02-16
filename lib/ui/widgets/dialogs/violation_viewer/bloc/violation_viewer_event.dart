part of 'violation_viewer_bloc.dart';

@freezed
sealed class ViolationViewerEvent with _$ViolationViewerEvent {
  const factory ViolationViewerEvent.loadRequested() =
      ViolationViewerEventLoadRequested;
}
