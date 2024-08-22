import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:media_kit/media_kit.dart' as media;
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../../../../../api/database.dart';
import '../../../../../api/entity/recording/recording.dart';
import '../../../../../api/entity/text_line/text_line.dart';
import '../../../../theme.dart';

part 'player_bloc.freezed.dart';
part 'player_event.dart';
part 'player_state.dart';

class PlayerBloc extends Bloc<PlayerEvent, PlayerState> {
  PlayerBloc({
    required final int id,
    final Recording? recording,
  }) : super(PlayerState(id: id)) {
    on<PlayerEvent>((final event, final emit) async {
      return switch (event) {
        _PlayerEventLoadRequested() => _onRecordingLoadRequested(event, emit),
        _PlayerEventRecordingLoaded() => _onRecordingLoaded(event, emit),
        _PlayerEventRecordingLoadingError() => _onRecordingLoadingError(event, emit),
        _PlayerEventDurationChanged() => _onDurationChanged(event, emit),
        _PlayerEventPlayingChanged() => _onPlayingChanged(event, emit),
        _PlayerEventError() => _onError(event, emit),
        PlayerEventPositionChanged() => _onPositionChanged(event, emit),
        PlayerEventJumpToLineRequested() => _onJumpedToLine(event, emit),
        PlayerEventStartedSeeking() => _onStartedSeeking(event, emit),
        PlayerEventSeekRequested() => _onSeekRequested(event, emit),
        PlayerEventPlayPauseButtonPressed() => _onPlayPauseButtonPressed(event, emit),
      };
    });

    _durationSubscription = _player.stream.duration.listen(_onPlayerDurationChanged);
    _positionSubscription = _player.stream.position.listen(_onPlayerPositionChanged);
    _playingSubscription = _player.stream.playing.listen(_onPlayerPlayingChanged);
    _errorSubscription = _player.stream.error.listen(_onPlayerError);

    if (recording != null) {
      add(_PlayerEventRecordingLoaded(recording: recording));
    } else {
      add(const _PlayerEventLoadRequested());
    }
  }

  final _player = media.Player(
    configuration: const media.PlayerConfiguration(
      logLevel: kDebugMode ? media.MPVLogLevel.debug : media.MPVLogLevel.error,
    ),
  );
  final scrollController = ItemScrollController();

  StreamSubscription? _durationSubscription;
  StreamSubscription? _positionSubscription;
  StreamSubscription? _playingSubscription;
  StreamSubscription? _errorSubscription;

  void _onPlayerDurationChanged(final Duration? newDuration) {
    if (newDuration == null) return;
    if (newDuration == Duration.zero) return;

    add(_PlayerEventDurationChanged(duration: newDuration));
  }

  void _onPlayerPositionChanged(final Duration? newPosition) {
    if (newPosition == null) return;

    final audioState = state.audioState;

    if (audioState is! PlayerAudioStateData) return;
    if (audioState.isSeeking) return;
    if (newPosition > audioState.duration) return;

    add(PlayerEventPositionChanged(position: newPosition));

    final textState = state.textState;

    if (textState is! PlayerTextStateData) return;

    for (var i = textState.textLines.length - 1; i >= 0; i--) {
      if (newPosition.inMilliseconds >= textState.textLines[i].time.inMilliseconds) {
        add(PlayerEventJumpToLineRequested(i, seekPlayer: false));
        return;
      }
    }
    add(const PlayerEventJumpToLineRequested(0, seekPlayer: false));
  }

  void _onPlayerPlayingChanged(final bool? newState) {
    if (newState == null) return;

    add(_PlayerEventPlayingChanged(isPlaying: newState));
  }

  void _onPlayerError(final String error) {
    add(_PlayerEventError(error: error));
  }

  Future<void> _onRecordingLoadRequested(final _PlayerEventLoadRequested event, final Emitter<PlayerState> emit) async {
    try {
      final recording = await db.from(Recording.tableName).select(Recording.fieldNames).eq($RecordingImplJsonKeys.id, state.id).single().withConverter(Recording.fromJson);
      add(_PlayerEventRecordingLoaded(recording: recording));
    } on Exception catch (e) {
      emit(state.copyWith(error: e.toString()));
    }
  }

  Future<void> _onRecordingLoaded(final _PlayerEventRecordingLoaded event, final Emitter<PlayerState> emit) async {
    await Future.wait([
      _loadAudio(event, emit),
      _loadText(event, emit),
    ]);
  }

  Future<void> _loadAudio(final _PlayerEventRecordingLoaded event, final Emitter<PlayerState> emit) async {
    try {
      await _player.open(media.Media(event.recording.audioUrl), play: false);
      emit(state.copyWith(audioState: const PlayerAudioStateData()));
    } on Exception catch (e) {
      emit(state.copyWith(audioState: PlayerAudioStateError(error: e.toString())));
    }
  }

  Future<void> _loadText(final _PlayerEventRecordingLoaded event, final Emitter<PlayerState> emit) async {
    try {
      if (!event.recording.hasLines) {
        emit(state.copyWith(textState: const PlayerTextStateProcessing()));
        return;
      }

      final textLines = await db.from(TextLine.tableName).select(TextLine.fieldNames).eq('record', state.id).order($TextLineImplJsonKeys.time, ascending: true).withConverter(TextLine.converter);

      if (textLines == null || textLines.isEmpty) {
        emit(state.copyWith(textState: const PlayerTextStateProcessing()));
        return;
      }

      final textSpans = _generateTextSpans(textLines);

      emit(
        state.copyWith(
          textState: PlayerTextStateData(
            textSpans: textSpans,
            textLines: textLines,
          ),
        ),
      );
    } on Exception catch (e) {
      emit(state.copyWith(textState: PlayerTextStateError(error: e.toString())));
    }
  }

  List<TextSpan> _generateTextSpans(final List<TextLine> textLines) {
    return List.generate(
      textLines.length,
      (final i) {
        final parts = <TextSpan>[];

        var charIndex = 0;
        for (var j = 0; j < textLines[i].highlights.length; j += 2) {
          if (charIndex < textLines[i].highlights[j].startIndex) {
            final substring = textLines[i].text.substring(charIndex, textLines[i].highlights[j].startIndex);
            parts.add(TextSpan(text: substring));
          }

          final substring2 = textLines[i].text.substring(textLines[i].highlights[j].startIndex, textLines[i].highlights[j].endIndex);
          parts.add(
            TextSpan(
              text: substring2,
              style: TextStyle(color: textLines[i].highlights[j].rule.color),
            ),
          );

          charIndex = textLines[i].highlights[j].endIndex;
        }

        if (charIndex < textLines[i].text.length) {
          final substring = textLines[i].text.substring(charIndex);
          parts.add(TextSpan(text: substring));
        }

        return TextSpan(children: List.castFrom(parts));
      },
      growable: false,
    );
  }

  Future<void> _onRecordingLoadingError(final _PlayerEventRecordingLoadingError event, final Emitter<PlayerState> emit) async {
    emit(state.copyWith(error: event.error));
  }

  Future<void> _onDurationChanged(final _PlayerEventDurationChanged event, final Emitter<PlayerState> emit) async {
    final audioState = state.audioState;
    if (audioState is! PlayerAudioStateData) return;

    emit(state.copyWith(audioState: audioState.copyWith(duration: event.duration)));
  }

  Future<void> _onPositionChanged(final PlayerEventPositionChanged event, final Emitter<PlayerState> emit) async {
    final audioState = state.audioState;
    if (audioState is! PlayerAudioStateData) return;

    emit(state.copyWith(audioState: audioState.copyWith(position: event.position)));
  }

  Future<void> _onPlayingChanged(final _PlayerEventPlayingChanged event, final Emitter<PlayerState> emit) async {
    final audioState = state.audioState;
    if (audioState is! PlayerAudioStateData) return;

    emit(state.copyWith(audioState: audioState.copyWith(isPlaying: event.isPlaying)));
  }

  Future<void> _onError(final _PlayerEventError event, final Emitter<PlayerState> emit) async {
    emit(state.copyWith(audioState: PlayerAudioStateError(error: event.error)));
  }

  Future<void> _onJumpedToLine(final PlayerEventJumpToLineRequested event, final Emitter<PlayerState> emit) async {
    final textState = state.textState;
    if (textState is! PlayerTextStateData) return;

    if (textState.currentTextLine == event.index) return;
    if (event.index < 0) return;
    if (event.index >= textState.textLines.length) return;

    emit(state.copyWith(textState: textState.copyWith(currentTextLine: event.index)));

    if (event.seekPlayer) {
      add(PlayerEventSeekRequested(textState.textLines[event.index].time + const Duration(milliseconds: 1)));
    }

    if (scrollController.isAttached) {
      await scrollController.scrollTo(
        index: event.index,
        alignment: 0.5,
        duration: scrollDuration,
        curve: scrollCurve,
      );
    }
  }

  Future<void> _onSeekRequested(final PlayerEventSeekRequested event, final Emitter<PlayerState> emit) async {
    final audioState = state.audioState;
    if (audioState is! PlayerAudioStateData) return;

    await _player.seek(event.position);

    if (!audioState.isSeeking) return;
    emit(state.copyWith(audioState: audioState.copyWith(isSeeking: false)));
  }

  Future<void> _onPlayPauseButtonPressed(final PlayerEventPlayPauseButtonPressed event, final Emitter<PlayerState> emit) async {
    final audioState = state.audioState;
    if (audioState is! PlayerAudioStateData) return;

    if (audioState.isPlaying) {
      await _player.pause();
    } else {
      await _player.play();
    }
  }

  Future<void> _onStartedSeeking(final PlayerEventStartedSeeking event, final Emitter<PlayerState> emit) async {
    final audioState = state.audioState;
    if (audioState is! PlayerAudioStateData) return;

    if (!audioState.isSeeking) {
      emit(state.copyWith(audioState: audioState.copyWith(isSeeking: true)));
    }
  }

  @override
  Future<void> close() {
    _durationSubscription?.cancel();
    _positionSubscription?.cancel();
    _playingSubscription?.cancel();
    _errorSubscription?.cancel();
    _player.dispose();
    return super.close();
  }
}
