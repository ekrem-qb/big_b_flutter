import 'text_line.dart';

class Recording {
  Recording({required this.audioUrl, required this.textLines});

  final Uri audioUrl;
  final List<TextLine>? textLines;
}
