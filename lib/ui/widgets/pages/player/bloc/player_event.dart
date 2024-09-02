part of 'player_bloc.dart';

@freezed
sealed class PlayerEvent with _$PlayerEvent {
  const factory PlayerEvent.loadRequested() = PlayerEventLoadRequested;
  const factory PlayerEvent.audioLoadRequested() = PlayerEventAudioLoadRequested;
  const factory PlayerEvent.textLoadRequested() = PlayerEventTextLoadRequested;

  const factory PlayerEvent.durationChanged({
    required final Duration duration,
  }) = _PlayerEventDurationChanged;

  const factory PlayerEvent.playingChanged({
    required final bool isPlaying,
  }) = _PlayerEventPlayingChanged;

  const factory PlayerEvent.error({
    required final String error,
  }) = _PlayerEventError;

  const factory PlayerEvent.positionChanged({
    required final Duration position,
  }) = PlayerEventPositionChanged;

  const factory PlayerEvent.jumpToLineRequested(
    final int index, {
    @Default(true) final bool seekPlayer,
  }) = PlayerEventJumpToLineRequested;

  const factory PlayerEvent.seekRequested(
    final Duration position,
  ) = PlayerEventSeekRequested;

  const factory PlayerEvent.playPauseButtonPressed() = PlayerEventPlayPauseButtonPressed;
  const factory PlayerEvent.startedSeeking() = PlayerEventStartedSeeking;
}
