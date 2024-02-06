import 'dart:async';

import 'package:flutter/widgets.dart';

import '../api/recording.dart';
import '../api/text_line.dart';
import '../constants.dart';

class Home extends ChangeNotifier {
  Home() {
    recordings = [
      Recording(
        audioUrl: Uri.parse('https://cdn.latestnaijamusic.com/wp-content/uploads/2022/12/Rema_Selena_Gomez_-_Calm_Down_Latestnaijamusic.com.mp3?_=1'),
        textLines: null,
      ),
      Recording(
        audioUrl: Uri.parse('https://firebasestorage.googleapis.com/v0/b/lmao-395118.appspot.com/o/CallRecord_20231009-224003_%2B905464647324.mp3?alt=media&token=6f8388f6-d0e5-4e9a-86c6-c618b4f1c3ed'),
        textLines: null,
      ),
    ];

    Future.microtask(_loadLyrics);
  }

  final ScrollController scrollController = ScrollController();

  List<Recording>? _recordings;
  List<Recording>? get recordings => _recordings;
  set recordings(final List<Recording>? value) {
    if (_recordings == value) return;

    _recordings = value;
    notifyListeners();
  }

  int? _selectedRecordingIndex;
  int? get selectedRecordingIndex => _selectedRecordingIndex;
  set selectedRecordingIndex(final int? value) {
    if (_selectedRecordingIndex == value) return;

    _selectedRecordingIndex = value;
    notifyListeners();
  }

  FutureOr _loadLyrics() {
    recordings![0] = Recording(
      audioUrl: recordings![0].audioUrl,
      textLines: lrcLyrics
          .map(
            (final textLine) => TextLine(
              time: Duration(
                minutes: int.parse(textLine.substring(1, 3)),
                seconds: int.parse(textLine.substring(4, 6)),
                milliseconds: int.parse(textLine.substring(7, 9)),
              ),
              content: textLine.substring(11),
            ),
          )
          .toList(),
    );
    recordings![1] = Recording(
      audioUrl: recordings![1].audioUrl,
      textLines: callText
          .map(
            (final textLine) => TextLine(
              time: Duration(
                minutes: int.parse(textLine.substring(1, 3)),
                seconds: int.parse(textLine.substring(4, 6)),
                milliseconds: int.parse(textLine.substring(7, 9)),
              ),
              content: textLine.substring(11),
            ),
          )
          .toList(),
    );
  }
}
