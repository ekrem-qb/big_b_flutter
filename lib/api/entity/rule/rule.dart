import 'dart:ui';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'rule.freezed.dart';
part 'rule.g.dart';

@freezed
class Rule with _$Rule {
  factory Rule({
    @JsonKey(includeToJson: false) required final int id,
    required final String description,
    required final String? details,
    @JsonKey(
      fromJson: Color.new,
      toJson: colorToJson,
    )
    required final Color color,
  }) = _Rule;

  factory Rule.fromJson(final Map<String, dynamic> json) => _$RuleFromJson(json);

  static const tableName = 'rules';
  static final fieldNames = _$$RuleImplFieldMap.values.join(',');
}

int colorToJson(final Color object) => object.value;
