import 'package:freezed_annotation/freezed_annotation.dart';

import '../entity.dart';

part 'text_line.freezed.dart';
part 'text_line.g.dart';

@Freezed(toJson: false)
class TextLine with _$TextLine implements Entity {
  const factory TextLine({
    required final int id,

    /// Duration at which the line should be displayed
    required final Duration time,

    /// Content of the line
    required final String text,
    required final bool isEmployee,
  }) = _TextLine;

  factory TextLine.fromJson(final Map<String, Object?> json) =>
      _$TextLineFromJson(json);

  static const tableName = 'lines';
  static final fieldNames = _$$TextLineImplFieldMap.values.join(',');

  static List<TextLine>? converter(final List<Map<String, Object?>> data) =>
      data.map(TextLine.fromJson).toList();
}
