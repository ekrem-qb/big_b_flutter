import 'package:freezed_annotation/freezed_annotation.dart';

part 'text_line.freezed.dart';
part 'text_line.g.dart';

@Freezed(toJson: false)
class TextLine with _$TextLine {
  const factory TextLine({
    /// Duration at which the line should be displayed
    required final Duration time,

    /// Content of the line
    required final String text,
    required final int partsCount,
    required final List<int> highlights,
    required final List<int> highlightColors,
  }) = _TextLine;

  factory TextLine.fromJson(final Map<String, dynamic> json) => _$TextLineFromJson(json);

  static const tableName = 'lines';
  static final fieldNames = 'id,${_$$TextLineImplFieldMap.values.join(',')}';

  static List<TextLine>? converter(final List<Map<String, dynamic>> data) => data.map(TextLine.fromJson).toList();
}
