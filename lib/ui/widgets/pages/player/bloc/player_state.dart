part of 'player_bloc.dart';

@freezed
sealed class PlayerState with _$PlayerState {
  const factory PlayerState({
    required final int id,
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
    @Default(false) final bool isSeeking,
  }) = _PlayerAudioState;
}

@freezed
sealed class PlayerTextState with _$PlayerTextState {
  const factory PlayerTextState.data({
    @Default(0) final int currentTextLine,
    @Default([]) final List<TextSpan> textSpans,
    @Default([]) final List<TextLine> textLines,
  }) = PlayerTextStateData;

  const factory PlayerTextState.processing() = PlayerTextStateProcessing;
}
