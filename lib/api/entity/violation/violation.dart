import 'package:freezed_annotation/freezed_annotation.dart';

import '../entity.dart';
import '../rule/rule.dart';
import '../text_line/text_line.dart';

part 'violation.freezed.dart';
part 'violation.g.dart';

@Freezed(toJson: false)
class Violation with _$Violation implements Entity {
  factory Violation.normal({
    required final int id,
    required final Rule rule,
  }) = NormalViolation;

  factory Violation.highlight({
    required final int id,
    required final Rule rule,
    required final TextLine line,
    required final int startIndex,
    required final int endIndex,
  }) = HighlightViolation;

  factory Violation.fromJson(final Map<String, dynamic> json) => _$ViolationFromJson(json);

  static const tableName = 'violations';
  static final fieldNames = {
    ..._$$NormalViolationImplFieldMap.values,
    ..._$$HighlightViolationImplFieldMap.values,
  }.join(',');

  static List<Violation>? converter(final List<Map<String, dynamic>> data) => data.map(Violation.fromJson).toList();
}
