part of 'violation_viewer_bloc.dart';

@freezed
sealed class ViolationViewerState with _$ViolationViewerState {
  const factory ViolationViewerState({
    required final int id,
    required final StatusOf<Violation, String> violation,
  }) = _ViolationViewerState;
}
