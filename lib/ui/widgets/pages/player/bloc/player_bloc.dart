import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:media_kit/media_kit.dart' as media;

import '../../../../../api/database.dart';
import '../../../../../api/entity/recording/recording.dart';
import '../../../../../api/entity/text_line/text_line.dart';
import '../../../../../api/entity/violation/violation.dart';
import '../../../../../api/enums/processing.dart';
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
           recordingState:
               recording == null
                   ? const StatusOfLoading()
                   : StatusOfData(recording),
         ),
       ) {
    on<PlayerEvent>((final event, final emit) async {
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
        PlayerEventPlayPauseButtonPressed() => _onPlayPauseButtonPressed(
          event,
          emit,
        ),
      };
    }, transformer: concurrent());

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

    switch (state.audioState) {
      case StatusOfData(:final data):
        if (newPosition > data.duration) return;

        add(_PlayerEventPositionChanged(position: newPosition));

        if (state.textState case StatusOfData(
          data: PlayerTextStateOnlyText(:final textLines) ||
              PlayerTextStateTextAndViolations(:final textLines),
        )) {
          for (var i = textLines.length - 1; i >= 0; i--) {
            if (newPosition.inMilliseconds >=
                textLines[i].time.inMilliseconds) {
              add(PlayerEventJumpToLineRequested(i, seekPlayer: false));
              return;
            }
          }
          add(const PlayerEventJumpToLineRequested(0, seekPlayer: false));
        }
      default:
    }
  }

  void _onPlayerPlayingChanged(final bool? newState) {
    if (newState == null) return;

    add(_PlayerEventPlayingChanged(isPlaying: newState));
  }

  void _onPlayerError(final String error) {
    add(_PlayerEventError(error: error));
  }

  Future<void> _onRecordingLoadRequested(
    final PlayerEventLoadRequested event,
    final Emitter<PlayerState> emit,
  ) async {
    try {
      final recording = await db
          .from(Recording.tableName)
          .select(Recording.fieldNames)
          .eq($RecordingImplJsonKeys.id, state.recordingId)
          .single()
          .withConverter(Recording.fromJson);
      emit(state.copyWith(recordingState: StatusOfData(recording)));
      add(const PlayerEventAudioLoadRequested());
      add(const PlayerEventTextLoadRequested());
    } catch (e) {
      emit(state.copyWith(recordingState: StatusOfError(e.toString())));
    }
  }

  Future<void> _onAudioLoadRequested(
    final PlayerEventAudioLoadRequested event,
    final Emitter<PlayerState> emit,
  ) async {
    switch (state.recordingState) {
      case StatusOfData(:final data):
        try {
          emit(state.copyWith(audioState: const StatusOfLoading()));

          await _player.open(media.Media(data.audioUrl), play: false);
          await _player.stream.buffer.first;

          switch (state.textState) {
            case StatusOfData(
                  data: PlayerTextStateOnlyText(
                        :final currentTextLine,
                        :final textLines,
                      ) ||
                      PlayerTextStateTextAndViolations(
                        :final currentTextLine,
                        :final textLines,
                      ),
                )
                when state.currentTextLineId != null:
              final currentDuration = textLines[currentTextLine].time;
              add(PlayerEventSeekRequested(currentDuration));
            default:
          }
          emit(
            state.copyWith(
              audioState: StatusOfData(
                PlayerAudioState(duration: _player.state.duration),
              ),
            ),
          );
        } catch (e) {
          emit(state.copyWith(audioState: StatusOfError(e.toString())));
        }
      default:
    }
  }

  Future<void> _onTextLoadRequested(
    final PlayerEventTextLoadRequested event,
    final Emitter<PlayerState> emit,
  ) async {
    switch (state.recordingState) {
      case StatusOfData(:final data):
        try {
          emit(state.copyWith(textState: const StatusOfLoading()));

          switch (data.processed) {
            case Processing.none:
              emit(
                state.copyWith(
                  textState: const StatusOfData(PlayerTextStateNone()),
                ),
              );
              return;
            case Processing.onlyText:
              final textLines = await _loadTextLines();

              if (textLines == null || textLines.isEmpty) {
                emit(
                  state.copyWith(
                    textState: const StatusOfData(PlayerTextStateNone()),
                  ),
                );
                return;
              }

              final selectedTextLineIndex = _findCurrentTextLineIndex(
                textLines,
              );

              emit(
                state.copyWith(
                  textState: StatusOfData(
                    PlayerTextStateOnlyText(
                      currentTextLine:
                          selectedTextLineIndex != -1
                              ? selectedTextLineIndex
                              : 0,
                      textLines: textLines,
                    ),
                  ),
                ),
              );
            case Processing.textAndViolations:
              final textLines = await _loadTextLines();

              if (textLines == null || textLines.isEmpty) {
                emit(
                  state.copyWith(
                    textState: const StatusOfData(PlayerTextStateNone()),
                  ),
                );
                return;
              }

              final selectedTextLineIndex = _findCurrentTextLineIndex(
                textLines,
              );

              StatusOf<List<Violation>, String> violationsStatus;

              try {
                final violations = await db
                    .from(Violation.tableName)
                    .select(Violation.fieldNames)
                    .eq($NormalViolationImplJsonKeys.record, state.recordingId)
                    .withConverter(Violation.converter);

                violationsStatus = StatusOfData(violations ?? const []);
              } catch (e) {
                violationsStatus = StatusOfError(e.toString());
              }

              final highlights = _arrangeHighlights(
                textLines,
                violationsStatus,
              );

              emit(
                state.copyWith(
                  textState: StatusOfData(
                    PlayerTextStateTextAndViolations(
                      currentTextLine:
                          selectedTextLineIndex != -1
                              ? selectedTextLineIndex
                              : 0,
                      textLines: textLines,
                      highlights: highlights,
                      violations: violationsStatus,
                    ),
                  ),
                ),
              );
          }
        } catch (e) {
          emit(state.copyWith(textState: StatusOfError(e.toString())));
        }
      default:
    }
  }

  Future<List<TextLine>?> _loadTextLines() async {
    final textLines = await db
        .from(TextLine.tableName)
        .select(TextLine.fieldNames)
        .eq('record', state.recordingId)
        .order($TextLineImplJsonKeys.time, ascending: true)
        .withConverter(TextLine.converter);
    return textLines;
  }

  int _findCurrentTextLineIndex(final List<TextLine> textLines) {
    final selectedTextLineId = state.currentTextLineId;
    final selectedTextLineIndex = textLines.indexWhere(
      (final textLine) => textLine.id == selectedTextLineId,
    );

    if (selectedTextLineIndex != -1) {
      add(PlayerEventSeekRequested(textLines[selectedTextLineIndex].time));
    }
    return selectedTextLineIndex;
  }

  List<List<HighlightViolation>> _arrangeHighlights(
    final List<TextLine> textLines,
    final StatusOf<List<Violation>, String> violationsStatus,
  ) {
    switch (violationsStatus) {
      case StatusOfData(:final data):
        final allHighlights = data.whereType<HighlightViolation>();

        if (allHighlights.isEmpty) {
          continue noHighlights;
        }

        return List.generate(textLines.length, (final i) {
          final highlights =
              allHighlights
                  .where(
                    (final highlight) => highlight.line.id == textLines[i].id,
                  )
                  .toList();

          return highlights;
        }, growable: false);
      noHighlights:
      default:
        return List<List<HighlightViolation>>.empty();
    }
  }

  Future<void> _onDurationChanged(
    final _PlayerEventDurationChanged event,
    final Emitter<PlayerState> emit,
  ) async {
    switch (state.audioState) {
      case StatusOfData(:final data):
        emit(
          state.copyWith(
            audioState: StatusOfData(data.copyWith(duration: event.duration)),
          ),
        );
      default:
    }
  }

  Future<void> _onPositionChanged(
    final _PlayerEventPositionChanged event,
    final Emitter<PlayerState> emit,
  ) async {
    switch (state.audioState) {
      case StatusOfData(:final data):
        emit(
          state.copyWith(
            audioState: StatusOfData(data.copyWith(position: event.position)),
          ),
        );
      default:
    }
  }

  Future<void> _onPlayingChanged(
    final _PlayerEventPlayingChanged event,
    final Emitter<PlayerState> emit,
  ) async {
    switch (state.audioState) {
      case StatusOfData(:final data):
        emit(
          state.copyWith(
            audioState: StatusOfData(data.copyWith(isPlaying: event.isPlaying)),
          ),
        );
      default:
    }
  }

  Future<void> _onError(
    final _PlayerEventError event,
    final Emitter<PlayerState> emit,
  ) async {
    emit(state.copyWith(audioState: StatusOfError(event.error)));
  }

  Future<void> _onJumpedToLine(
    final PlayerEventJumpToLineRequested event,
    final Emitter<PlayerState> emit,
  ) async {
    final textState = state.textState;
    if (textState case StatusOfData(
      data: PlayerTextStateOnlyText(:final currentTextLine, :final textLines) ||
          PlayerTextStateTextAndViolations(
            :final currentTextLine,
            :final textLines,
          ),
    )) {
      if (currentTextLine == event.index) return;
      if (event.index < 0) return;
      if (event.index >= textLines.length) return;

      emit(
        state.copyWith(
          currentTextLineId: textLines[event.index].id,
          textState: switch (textState.data) {
            final PlayerTextStateNone data =>
              StatusOfData<PlayerTextStateNone, String>(data),
            final PlayerTextStateOnlyText data =>
              StatusOfData<PlayerTextStateOnlyText, String>(
                data.copyWith(currentTextLine: event.index),
              ),
            final PlayerTextStateTextAndViolations data =>
              StatusOfData<PlayerTextStateTextAndViolations, String>(
                data.copyWith(currentTextLine: event.index),
              ),
          },
        ),
      );

      if (event.seekPlayer) {
        add(PlayerEventSeekRequested(textLines[event.index].time));
      }
    }
  }

  Future<void> _onSeekRequested(
    final PlayerEventSeekRequested event,
    final Emitter<PlayerState> emit,
  ) async {
    switch (state.audioState) {
      case StatusOfData():
        await _player.seek(event.position + const Duration(milliseconds: 1));
      default:
    }
  }

  Future<void> _onPlayPauseButtonPressed(
    final PlayerEventPlayPauseButtonPressed event,
    final Emitter<PlayerState> emit,
  ) async {
    switch (state.audioState) {
      case StatusOfData(:final data):
        if (data.isPlaying) {
          await _player.pause();
        } else {
          await _player.play();
        }
      default:
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
