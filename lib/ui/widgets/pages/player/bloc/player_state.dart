part of 'player_bloc.dart';

@freezed
sealed class PlayerState with _$PlayerState {
  const factory PlayerState({
    required final int recordingId,
    final int? currentTextLineId,
    @Default(StatusOfLoading()) final StatusOf<Recording, String> recordingState,
    @Default(StatusOfLoading()) final StatusOf<PlayerAudioState, String> audioState,
    @Default(StatusOfLoading()) final StatusOf<PlayerTextState, String> textState,
  }) = _PlayerState;
}

@freezed
class PlayerAudioState with _$PlayerAudioState {
  const factory PlayerAudioState({
    @Default(Duration.zero) final Duration position,
    @Default(Duration(seconds: 1)) final Duration duration,
    @Default(false) final bool isPlaying,
  }) = _PlayerAudioState;
}

@freezed
sealed class PlayerTextState with _$PlayerTextState {
  const factory PlayerTextState.none() = PlayerTextStateNone;

  const factory PlayerTextState.onlyText({
    @Default(0) final int currentTextLine,
    @Default([]) final List<TextLine> textLines,
  }) = PlayerTextStateOnlyText;

  const factory PlayerTextState.textAndViolations({
    @Default(0) final int currentTextLine,
    @Default([]) final List<TextLine> textLines,
    @Default([]) final List<List<HighlightViolation>> highlights,
    @Default(StatusOfLoading()) final StatusOf<List<Violation>, String> violations,
  }) = PlayerTextStateTextAndViolations;
}
