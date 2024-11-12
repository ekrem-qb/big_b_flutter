part of 'player_bloc.dart';

typedef TextLineWithHighlights = (
  TextLine textLine,
  List<HighlightViolation> highlights,
);

@freezed
sealed class PlayerState with _$PlayerState {
  const factory PlayerState({
    required final int recordingId,
    final int? currentTextLineId,
    @Default(StatusOfLoading()) final StatusOf<Recording> recordingState,
    @Default(StatusOfLoading()) final StatusOf<PlayerAudioState> audioState,
    @Default(StatusOfLoading()) final StatusOf<PlayerTextState> textState,
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
  const factory PlayerTextState.data({
    @Default(0) final int currentTextLine,
    @Default([]) final List<TextLineWithHighlights> textLinesWithHighlights,
    @Default(StatusOfLoading()) final StatusOf<List<Violation>> violations,
  }) = PlayerTextStateData;

  const factory PlayerTextState.processing() = PlayerTextStateProcessing;
}
