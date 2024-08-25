import 'package:freezed_annotation/freezed_annotation.dart';

import '../entity.dart';
import '../rule/rule.dart';

part 'highlight.freezed.dart';
part 'highlight.g.dart';

@Freezed(toJson: false)
class Highlight with _$Highlight implements Entity {
  factory Highlight({
    required final int id,
    required final int startIndex,
    required final int endIndex,
    required final Rule rule,
  }) = _Highlight;

  factory Highlight.fromJson(final Map<String, dynamic> json) => _$HighlightFromJson(json);

  static const tableName = 'highlights';
  static final fieldNames = _$$HighlightImplFieldMap.values.join(',');
}
