import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:media_kit/media_kit.dart' as media;

import '../../../../../api/database.dart';
import '../../../../../api/entity/recording/recording.dart';
import '../../../../../api/entity/text_line/text_line.dart';
import '../../../../../api/entity/violation/violation.dart';
import '../../../../entity/status.dart';

part 'player_bloc.freezed.dart';
part 'player_event.dart';
part 'player_state.dart';

class PlayerBloc extends Bloc<PlayerEvent, PlayerState> {
  PlayerBloc({
    required final int recordingId,
    final int? textLineId,
    final Recording? recording,
  }) : super(
          PlayerState(
            recordingId: recordingId,
            currentTextLineId: textLineId,
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

    _playerSubscriptions = [
      _player.stream.duration.listen(_onPlayerDurationChanged),
      _player.stream.position.listen(_onPlayerPositionChanged),
      _player.stream.playing.listen(_onPlayerPlayingChanged),
      _player.stream.error.listen(_onPlayerError),
    ];

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

  late final List<StreamSubscription<Object>> _playerSubscriptions;

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
      final recording = await db.from(Recording.tableName).select(Recording.fieldNames).eq($RecordingImplJsonKeys.id, state.recordingId).single().withConverter(Recording.fromJson);
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

      switch (state.textState) {
        case StatusOfData<PlayerTextStateData>(
              data: PlayerTextStateData(
                :final currentTextLine,
                :final textLines,
              ),
            )
            when state.currentTextLineId != null:
          final currentDuration = textLines[currentTextLine].time;
          add(PlayerEventSeekRequested(currentDuration));
        default:
      }
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

      final textLines = await db.from(TextLine.tableName).select(TextLine.fieldNames).eq('record', state.recordingId).order($TextLineImplJsonKeys.time, ascending: true).withConverter(TextLine.converter);

      if (textLines == null || textLines.isEmpty) {
        emit(state.copyWith(textState: const StatusOfData(PlayerTextStateProcessing())));
        return;
      }

      StatusOf<List<Violation>> violationsStatus;

      try {
        final violations = await db.from(Violation.tableName).select(Violation.fieldNames).eq('record', state.recordingId).withConverter(Violation.converter);

        violationsStatus = violations == null || violations.isEmpty ? const StatusOfLoading() : StatusOfData(violations);
      } on Exception catch (e) {
        violationsStatus = StatusOfError(e.toString());
      }

      final textSpans = _generateTextSpans(textLines, violationsStatus);

      final selectedTextLineId = state.currentTextLineId;
      final selectedTextLineIndex = textLines.indexWhere((final textLine) => textLine.id == selectedTextLineId);

      emit(
        state.copyWith(
          textState: StatusOfData<PlayerTextStateData>(
            PlayerTextStateData(
              currentTextLine: selectedTextLineIndex != -1 ? selectedTextLineIndex : 0,
              textSpans: textSpans,
              textLines: textLines,
              violations: violationsStatus,
            ),
          ),
        ),
      );

      if (selectedTextLineIndex != -1) {
        add(PlayerEventSeekRequested(textLines[selectedTextLineIndex].time));
      }
    } on Exception catch (e) {
      emit(state.copyWith(textState: StatusOfError(e.toString())));
    }
  }

  List<TextSpan> _generateTextSpans(final List<TextLine> textLines, final StatusOf<List<Violation>> violationsStatus) {
    switch (violationsStatus) {
      case StatusOfData(
          :final data,
        ):
        final allHighlights = data.whereType<HighlightViolation>();

        if (allHighlights.isEmpty) {
          continue noHighlights;
        }

        return List.generate(
          textLines.length,
          (final i) {
            final highlights = allHighlights.where((final highlight) => highlight.line.id == textLines[i].id).toList();
            final parts = _generateTextSpanParts(textLines[i], highlights).toList();

            return TextSpan(children: parts);
          },
          growable: false,
        );
      noHighlights:
      default:
        return textLines.map((final e) => TextSpan(text: e.text)).toList();
    }
  }

  Iterable<InlineSpan> _generateTextSpanParts(final TextLine textLine, final List<HighlightViolation> highlights) sync* {
    var charIndex = 0;
    for (var j = 0; j < highlights.length; j += 2) {
      if (charIndex < highlights[j].startIndex) {
        final substring = textLine.text.substring(charIndex, highlights[j].startIndex);
        yield TextSpan(text: substring);
      }

      final substring2 = textLine.text.substring(highlights[j].startIndex, highlights[j].endIndex);
      yield TextSpan(
        text: substring2,
        style: TextStyle(color: highlights[j].rule.color),
      );

      charIndex = highlights[j].endIndex;
    }

    if (charIndex < textLine.text.length) {
      final substring = textLine.text.substring(charIndex);
      yield TextSpan(text: substring);
    }
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
        currentTextLineId: textState.data.textLines[event.index].id,
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
    for (var i = 0; i < _playerSubscriptions.length; i++) {
      _playerSubscriptions[i].cancel();
    }
    _player.dispose();
    return super.close();
  }
}
