import 'dart:async';

import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../../../api/database.dart';
import '../../../api/recording.dart';
import '../../../api/text_line.dart';
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

  List<TextLine>? _textLines;
  List<TextLine>? get textLines => _textLines;
  set textLines(final List<TextLine>? value) {
    if (_textLines == value) return;

    _textLines = value;
    notifyListeners();
  }

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
      textLines = await db.from(TextLine.tableName).select(TextLine.fieldNames).eq('record', _recording.id).order('time', ascending: true).withConverter(TextLine.converter);
    } on Exception catch (e) {
      textLines = [];
      showSnackbar(text: e.toString(), context: _context);
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

    position = newPosition;

    if (textLines == null) return;

    for (var i = textLines!.length - 1; i >= 0; i--) {
      if (newPosition.inMilliseconds >= textLines![i].time.inMilliseconds) {
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
    if (index >= textLines!.length) return;

    currentTextLine = index;

    if (scrollController.isAttached) {
      scrollController.scrollTo(
        index: index,
        alignment: 0.5,
        duration: scrollDuration,
        curve: scrollCurve,
      );
    }

    if (textLines != null && seekPlayer) {
      seek(textLines![index].time);
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
