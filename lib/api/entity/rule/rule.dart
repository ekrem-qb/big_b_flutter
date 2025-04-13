import 'dart:ui';

import 'package:freezed_annotation/freezed_annotation.dart';

import '../join_table.dart';

part 'rule.freezed.dart';
part 'rule.g.dart';

@freezed
sealed class Rule with _$Rule {
  const factory Rule.words({
    @JsonKey(includeToJson: false) required final int id,
    required final Set<String> words,
    @JsonKey(fromJson: Color.new, toJson: colorToJson)
    required final Color color,
  }) = WordsRule;

  const factory Rule.name({
    @JsonKey(includeToJson: false) required final int id,
    @JsonKey(fromJson: Color.new, toJson: colorToJson)
    required final Color color,
  }) = NameRule;

  const factory Rule.custom({
    @JsonKey(includeToJson: false) required final int id,
    required final String description,
    required final String details,
    @JsonKey(fromJson: Color.new, toJson: colorToJson)
    required final Color color,
  }) = CustomRule;

  factory Rule.fromJson(final Map<String, Object?> json) =>
      _$RuleFromJson(json);

  static const tableName = 'rules';
  static const joinTables = <JoinTable>[];
  static final fieldNames = {
    ..._$$NameRuleImplFieldMap.values,
    ..._$$WordsRuleImplFieldMap.values,
    ..._$$CustomRuleImplFieldMap.values,
  }.join(',');

  static List<Rule>? converter(final List<Map<String, Object?>> data) =>
      data.map(Rule.fromJson).toList(growable: false);
}

int _floatToInt8(final double x) => (x * 255.0).round() & 0xff;

int colorToJson(final Color object) =>
    _floatToInt8(object.a) << 24 |
    _floatToInt8(object.r) << 16 |
    _floatToInt8(object.g) << 8 |
    _floatToInt8(object.b) << 0;
