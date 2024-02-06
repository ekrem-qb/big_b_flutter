class TextLine {
  TextLine({
    required this.time,
    required this.content,
  });

  /// Duration at which the line should be displayed
  final Duration time;

  /// Content of the line
  final String content;
}
