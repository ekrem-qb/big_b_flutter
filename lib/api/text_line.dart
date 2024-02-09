import 'package:freezed_annotation/freezed_annotation.dart';

part 'text_line.freezed.dart';
part 'text_line.g.dart';

@freezed
class TextLine with _$TextLine {
  const factory TextLine({
    /// Duration at which the line should be displayed
    required final Duration time,

    /// Content of the line
    required final String text,
  }) = _TextLine;

  factory TextLine.fromJson(final Map<String, dynamic> json) => _$TextLineFromJson(json);

  static const tableName = 'lines';
  static final fieldNames = _$$TextLineImplFieldMap.values.join(',');

  static List<TextLine>? converter(final List<Map<String, dynamic>> data) => data.map(TextLine.fromJson).toList();
}
