import 'package:freezed_annotation/freezed_annotation.dart';

part 'highlight.freezed.dart';
part 'highlight.g.dart';

@Freezed(toJson: false)
class Highlight with _$Highlight {
  factory Highlight({
    required final int id,
    required final int startIndex,
    required final int endIndex,
    required final int type,
  }) = _Highlight;

  factory Highlight.fromJson(final Map<String, dynamic> json) => _$HighlightFromJson(json);

  static const tableName = 'highlights';
  static final fieldNames = _$$HighlightImplFieldMap.values.join(',');
}
