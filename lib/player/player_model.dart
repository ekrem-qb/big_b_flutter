import 'dart:async';

import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../constants.dart';
import '../text_line.dart';

class Home extends ChangeNotifier {
  Home() {
    _player.setAudioSource(
      AudioSource.uri(
        Uri.parse(
          'https://cdn.latestnaijamusic.com/wp-content/uploads/2022/12/Rema_Selena_Gomez_-_Calm_Down_Latestnaijamusic.com.mp3?_=1',
        ),
      ),
    );
    durationSubscription = _player.durationStream.listen(_onDurationChanged);
    positionSubscription = _player.positionStream.listen(_onPositionChanged);
    playingSubscription = _player.playingStream.listen(_onPlayingChanged);

    Future.microtask(_loadTextLines);
  }

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

  void _loadTextLines() {
    _textLines = lrcLyrics
        .map(
          (final textLine) => TextLine(
            time: Duration(
              minutes: int.parse(textLine.substring(1, 3)),
              seconds: int.parse(textLine.substring(4, 6)),
              milliseconds: int.parse(textLine.substring(7, 9)),
            ),
            content: textLine,
          ),
        )
        .toList();
  }

  void _onDurationChanged(final Duration? newDuration) {
    if (newDuration == null) return;
    if (newDuration == Duration.zero) return;

    duration = newDuration;
  }

  /// Returns element closest
  /// to target in arr[]
  int _findClosestIndex(final List<Duration> arr, final Duration target) {
    final n = arr.length;

    /// Corner cases
    if (target <= arr[0]) return 0;
    if (target >= arr[n - 1]) return n - 1;

    /// Doing binary search
    var i = 0, j = n, mid = 0;
    while (i < j) {
      mid = ((i + j) / 2).floor();

      if (arr[mid] == target) return mid;

      /* If target is less
            than array element,
            then search in left */
      if (target < arr[mid]) {
        /// If target is greater
        /// than previous to mid,
        /// return closest of two
        if (mid > 0 && target > arr[mid - 1]) return _getClosestIndex(arr, mid - 1, mid, target);

        /* Repeat for left half */
        j = mid;
      }

      /// If target is
      /// greater than mid
      else {
        if (mid < n - 1 && target < arr[mid + 1]) return _getClosestIndex(arr, mid, mid + 1, target);
        i = mid + 1;

        /// update i
      }
    }

    /// Only single element
    /// left after search
    return mid;
  }

  /// Method to compare which one
  /// is the more close We find the
  /// closest by taking the difference
  /// between the target and both
  /// values. It assumes that val2 is
  /// greater than val1 and target
  /// lies between these two.
  int _getClosestIndex(final List<Duration> arr, final int val1, final int val2, final Duration target) {
    if (target - arr[val1] >= arr[val2] - target) {
      return val2;
    } else {
      return val1;
    }
  }

  void _onPositionChanged(final Duration? newPosition) {
    if (isSeeking) return;
    if (newPosition == null) return;

    position = newPosition;

    if (position == duration) {
      _player.pause();
    }

    if (_textLines == null) return;

    jumpToLine(
      _findClosestIndex(textLines!.map((final e) => e.time).toList(), newPosition),
      seekPlayer: false,
    );
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
