import 'package:freezed_annotation/freezed_annotation.dart';

import '../entity.dart';
import '../join_table.dart';
import '../recording/recording.dart';
import '../rule/rule.dart';
import '../text_line/text_line.dart';

part 'violation.freezed.dart';
part 'violation.g.dart';

@Freezed(toJson: false)
sealed class Violation with _$Violation implements Entity {
  factory Violation.normal({
    required final int id,
    required final Rule rule,
    required final Recording record,
  }) = NormalViolation;

  factory Violation.highlight({
    required final int id,
    required final Rule rule,
    required final Recording record,
    required final TextLine line,
    required final int startIndex,
    required final int endIndex,
  }) = HighlightViolation;

  factory Violation.fromJson(final Map<String, dynamic> json) => _$ViolationFromJson(json);

  static Violation? maybeFromJson(final Map<String, dynamic>? json) => json != null ? _$ViolationFromJson(json) : null;

  static const tableName = 'violations';
  static final joinTables = [
    JoinTable(
      joinFieldName: $NormalViolationImplJsonKeys.record,
      tableName: Recording.tableName,
      fieldNames: Recording.fieldNames,
    ),
    JoinTable(
      joinFieldName: $NormalViolationImplJsonKeys.rule,
      tableName: Rule.tableName,
      fieldNames: Rule.fieldNames,
    ),
    JoinTable(
      joinFieldName: $HighlightViolationImplJsonKeys.line,
      tableName: TextLine.tableName,
      fieldNames: TextLine.fieldNames,
    ),
  ];
  static final fieldNames = '${joinTables.join(',')},${{
    ..._$$NormalViolationImplFieldMap.values,
    ..._$$HighlightViolationImplFieldMap.values,
  }.join(',')}';

  static List<Violation>? converter(final List<Map<String, dynamic>> data) => data.map(Violation.fromJson).toList();
}
