import 'dart:async';

import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../../../api/database.dart';
import '../../../api/entity/recording/recording.dart';
import '../../../api/entity/text_line/text_line.dart';
import '../../../constants.dart';
import '../../../ui/theme.dart';
import '../extensions/snackbar.dart';

class Player extends ChangeNotifier {
  Player(this._context, {required final Recording recording}) : _recording = recording {
    durationSubscription = _player.durationStream.listen(_onDurationChanged);
    positionSubscription = _player.positionStream.listen(_onPositionChanged);
    playingSubscription = _player.playingStream.listen(_onPlayingChanged);

    Future.microtask(_load);
  }

  final BuildContext _context;
  final Recording _recording;
  final _player = AudioPlayer();
  final scrollController = ItemScrollController();
  final offsetController = ScrollOffsetController();

  late final StreamSubscription durationSubscription;
  late final StreamSubscription positionSubscription;
  late final StreamSubscription playingSubscription;

  bool isSeeking = false;

  Duration _position = Duration.zero;
  Duration get position => _position;
  set position(final Duration value) {
    if (_position == value) return;

    _position = value;
    notifyListeners();
  }

  Duration _duration = const Duration(seconds: 1);
  Duration get duration => _duration;
  set duration(final Duration value) {
    if (_duration == value) return;

    _duration = value;
    notifyListeners();
  }

  bool _isPlaying = false;
  bool get isPlaying => _isPlaying;
  set isPlaying(final bool value) {
    if (_isPlaying == value) return;

    _isPlaying = value;
    notifyListeners();
  }

  bool? _isAudioLoaded;
  bool? get isAudioLoaded => _isAudioLoaded;
  set isAudioLoaded(final bool? value) {
    if (_isAudioLoaded == value) return;

    _isAudioLoaded = value;
    notifyListeners();
  }

  int _currentTextLine = 0;
  int get currentTextLine => _currentTextLine;
  set currentTextLine(final int value) {
    if (_currentTextLine == value) return;

    _currentTextLine = value;
    notifyListeners();
  }

  List<TextSpan>? _textSpans;
  List<TextSpan>? get textSpans => _textSpans;
  set textSpans(final List<TextSpan>? value) {
    if (_textSpans == value) return;

    _textSpans = value;
    notifyListeners();
  }

  List<TextLine>? _textLines;

  Future<void> _load() async {
    await Future.wait([
      _loadAudio(),
      _loadText(),
    ]);
  }

  Future<void> _loadAudio() async {
    try {
      await _player.setAudioSource(
        AudioSource.uri(_recording.audioUrl),
      );
      isAudioLoaded = true;
    } on Exception catch (e) {
      isAudioLoaded = false;
      showSnackbar(text: e.toString(), context: _context);
    }
  }

  Future<void> _loadText() async {
    try {
      _textLines = await db.from(TextLine.tableName).select(TextLine.fieldNames).eq('record', _recording.id).order($TextLineImplJsonKeys.time, ascending: true).withConverter(TextLine.converter);

      if (_textLines == null) return;

      textSpans = List.generate(
        _textLines!.length,
        (final i) {
          final parts = <TextSpan>[];

          var charIndex = 0;
          for (var j = 0; j < _textLines![i].highlights.length; j += 2) {
            if (charIndex < _textLines![i].highlights[j].startIndex) {
              final substring = _textLines![i].text.substring(charIndex, _textLines![i].highlights[j].startIndex);
              parts.add(TextSpan(text: substring));
            }

            final substring2 = _textLines![i].text.substring(_textLines![i].highlights[j].startIndex, _textLines![i].highlights[j].endIndex);
            parts.add(
              TextSpan(
                text: substring2,
                style: TextStyle(color: _getHighlightColor(i, j)),
              ),
            );

            charIndex = _textLines![i].highlights[j].endIndex;
          }

          if (charIndex < _textLines![i].text.length) {
            final substring = _textLines![i].text.substring(charIndex);
            parts.add(TextSpan(text: substring));
          }

          return TextSpan(children: List.castFrom(parts));
        },
        growable: false,
      );
    } on Exception catch (e) {
      textSpans = List.empty();
      showSnackbar(text: e.toString(), context: _context);
    }
  }

  Color? _getHighlightColor(final int textLineIndex, final int highlightIndex) {
    try {
      return highlightColors[_textLines![textLineIndex].highlights[highlightIndex].type];
    } on Exception catch (e) {
      showSnackbar(text: e.toString(), context: _context);
      return null;
    }
  }

  void _onDurationChanged(final Duration? newDuration) {
    if (newDuration == null) return;
    if (newDuration == Duration.zero) return;

    duration = newDuration;
  }

  void _onPositionChanged(final Duration? newPosition) {
    if (isSeeking) return;
    if (newPosition == null) return;
    if (newPosition > duration) return;

    position = newPosition;

    if (_textLines == null) return;

    for (var i = _textLines!.length - 1; i >= 0; i--) {
      if (newPosition.inMilliseconds >= _textLines![i].time.inMilliseconds) {
        jumpToLine(i, seekPlayer: false);
        return;
      }
    }
    jumpToLine(0, seekPlayer: false);
  }

  void _onPlayingChanged(final bool? newState) {
    if (newState == null) return;

    isPlaying = newState;
  }

  void play() {
    if (isPlaying) {
      _player.pause();
    } else {
      _player.play();
    }
  }

  void seek(final Duration newValue) {
    _player.seek(newValue);
    isSeeking = false;
  }

  void jumpToLine(
    final int index, {
    final bool seekPlayer = true,
  }) {
    if (currentTextLine == index) return;
    if (index < 0) return;
    if (index >= _textLines!.length) return;

    currentTextLine = index;

    if (scrollController.isAttached) {
      scrollController.scrollTo(
        index: index,
        alignment: 0.5,
        duration: scrollDuration,
        curve: scrollCurve,
      );
    }

    if (_textLines != null && seekPlayer) {
      seek(_textLines![index].time);
    }
  }

  @override
  void dispose() {
    durationSubscription.cancel();
    positionSubscription.cancel();
    playingSubscription.cancel();
    _player.dispose();
    super.dispose();
  }
}
