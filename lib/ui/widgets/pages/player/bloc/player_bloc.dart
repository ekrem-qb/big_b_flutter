import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:media_kit/media_kit.dart' as media;
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../../../../../api/database.dart';
import '../../../../../api/entity/recording/recording.dart';
import '../../../../../api/entity/text_line/text_line.dart';
import '../../../../entity/status.dart';
import '../../../../theme.dart';

part 'player_bloc.freezed.dart';
part 'player_event.dart';
part 'player_state.dart';

class PlayerBloc extends Bloc<PlayerEvent, PlayerState> {
  PlayerBloc({
    required final int id,
    final Recording? recording,
  }) : super(
          PlayerState(
            id: id,
            recordingState: recording == null ? const StatusOfLoading() : StatusOfData(recording),
          ),
        ) {
    on<PlayerEvent>(
      (final event, final emit) async {
        return switch (event) {
          PlayerEventLoadRequested() => _onRecordingLoadRequested(event, emit),
          PlayerEventAudioLoadRequested() => _onAudioLoadRequested(event, emit),
          PlayerEventTextLoadRequested() => _onTextLoadRequested(event, emit),
          _PlayerEventDurationChanged() => _onDurationChanged(event, emit),
          _PlayerEventPlayingChanged() => _onPlayingChanged(event, emit),
          _PlayerEventError() => _onError(event, emit),
          _PlayerEventPositionChanged() => _onPositionChanged(event, emit),
          PlayerEventJumpToLineRequested() => _onJumpedToLine(event, emit),
          PlayerEventSeekRequested() => _onSeekRequested(event, emit),
          PlayerEventPlayPauseButtonPressed() => _onPlayPauseButtonPressed(event, emit),
        };
      },
      transformer: concurrent(),
    );

    _durationSubscription = _player.stream.duration.listen(_onPlayerDurationChanged);
    _positionSubscription = _player.stream.position.listen(_onPlayerPositionChanged);
    _playingSubscription = _player.stream.playing.listen(_onPlayerPlayingChanged);
    _errorSubscription = _player.stream.error.listen(_onPlayerError);

    if (state.recordingState is StatusOfLoading) {
      add(const PlayerEventLoadRequested());
    } else {
      if (state.audioState is StatusOfLoading) {
        add(const PlayerEventAudioLoadRequested());
      }
      if (state.textState is StatusOfLoading) {
        add(const PlayerEventTextLoadRequested());
      }
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

    if (audioState is! StatusOfData<PlayerAudioState>) return;
    if (newPosition > audioState.data.duration) return;

    add(_PlayerEventPositionChanged(position: newPosition));

    final textState = state.textState;

    if (textState is! StatusOfData<PlayerTextStateData>) return;

    for (var i = textState.data.textLines.length - 1; i >= 0; i--) {
      if (newPosition.inMilliseconds >= textState.data.textLines[i].time.inMilliseconds) {
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

  Future<void> _onRecordingLoadRequested(final PlayerEventLoadRequested event, final Emitter<PlayerState> emit) async {
    try {
      final recording = await db.from(Recording.tableName).select(Recording.fieldNames).eq($RecordingImplJsonKeys.id, state.id).single().withConverter(Recording.fromJson);
      emit(state.copyWith(recordingState: StatusOfData(recording)));
      add(const PlayerEventAudioLoadRequested());
      add(const PlayerEventTextLoadRequested());
    } on Exception catch (e) {
      emit(state.copyWith(recordingState: StatusOfError(e.toString())));
    }
  }

  Future<void> _onAudioLoadRequested(final PlayerEventAudioLoadRequested event, final Emitter<PlayerState> emit) async {
    final recordingState = state.recordingState;

    if (recordingState is! StatusOfData<Recording>) return;

    try {
      emit(state.copyWith(audioState: const StatusOfLoading()));

      await _player.open(media.Media(recordingState.data.audioUrl), play: false);
      emit(state.copyWith(audioState: const StatusOfData(PlayerAudioState())));
    } on Exception catch (e) {
      emit(state.copyWith(audioState: StatusOfError(e.toString())));
    }
  }

  Future<void> _onTextLoadRequested(final PlayerEventTextLoadRequested event, final Emitter<PlayerState> emit) async {
    final recordingState = state.recordingState;

    if (recordingState is! StatusOfData<Recording>) return;

    try {
      emit(state.copyWith(textState: const StatusOfLoading()));

      if (!recordingState.data.hasLines) {
        emit(state.copyWith(textState: const StatusOfData(PlayerTextStateProcessing())));
        return;
      }

      final textLines = await db.from(TextLine.tableName).select(TextLine.fieldNames).eq('record', state.id).order($TextLineImplJsonKeys.time, ascending: true).withConverter(TextLine.converter);

      if (textLines == null || textLines.isEmpty) {
        emit(state.copyWith(textState: const StatusOfData(PlayerTextStateProcessing())));
        return;
      }

      final textSpans = _generateTextSpans(textLines);

      emit(
        state.copyWith(
          textState: StatusOfData<PlayerTextStateData>(
            PlayerTextStateData(
              textSpans: textSpans,
              textLines: textLines,
            ),
          ),
        ),
      );
    } on Exception catch (e) {
      emit(state.copyWith(textState: StatusOfError(e.toString())));
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

  Future<void> _onDurationChanged(final _PlayerEventDurationChanged event, final Emitter<PlayerState> emit) async {
    final audioState = state.audioState;
    if (audioState is! StatusOfData<PlayerAudioState>) return;

    emit(state.copyWith(audioState: StatusOfData(audioState.data.copyWith(duration: event.duration))));
  }

  Future<void> _onPositionChanged(final _PlayerEventPositionChanged event, final Emitter<PlayerState> emit) async {
    final audioState = state.audioState;
    if (audioState is! StatusOfData<PlayerAudioState>) return;

    emit(state.copyWith(audioState: StatusOfData(audioState.data.copyWith(position: event.position))));
  }

  Future<void> _onPlayingChanged(final _PlayerEventPlayingChanged event, final Emitter<PlayerState> emit) async {
    final audioState = state.audioState;
    if (audioState is! StatusOfData<PlayerAudioState>) return;

    emit(state.copyWith(audioState: StatusOfData(audioState.data.copyWith(isPlaying: event.isPlaying))));
  }

  Future<void> _onError(final _PlayerEventError event, final Emitter<PlayerState> emit) async {
    emit(state.copyWith(audioState: StatusOfError(event.error)));
  }

  Future<void> _onJumpedToLine(final PlayerEventJumpToLineRequested event, final Emitter<PlayerState> emit) async {
    final textState = state.textState;
    if (textState is! StatusOfData<PlayerTextStateData>) return;

    if (textState.data.currentTextLine == event.index) return;
    if (event.index < 0) return;
    if (event.index >= textState.data.textLines.length) return;

    emit(
      state.copyWith(
        textState: StatusOfData<PlayerTextStateData>(
          textState.data.copyWith(
            currentTextLine: event.index,
          ),
        ),
      ),
    );

    if (event.seekPlayer) {
      add(PlayerEventSeekRequested(textState.data.textLines[event.index].time));
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
    if (audioState is! StatusOfData<PlayerAudioState>) return;

    await _player.seek(event.position + const Duration(milliseconds: 1));
  }

  Future<void> _onPlayPauseButtonPressed(final PlayerEventPlayPauseButtonPressed event, final Emitter<PlayerState> emit) async {
    final audioState = state.audioState;
    if (audioState is! StatusOfData<PlayerAudioState>) return;

    if (audioState.data.isPlaying) {
      await _player.pause();
    } else {
      await _player.play();
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
