// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rule.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RuleImpl _$$RuleImplFromJson(Map<String, dynamic> json) => _$RuleImpl(
      id: (json['id'] as num).toInt(),
      description: json['description'] as String,
      details: json['details'] as String?,
      color: Color((json['color'] as num).toInt()),
    );

const _$$RuleImplFieldMap = <String, String>{
  'id': 'id',
  'description': 'description',
  'details': 'details',
  'color': 'color',
};

abstract final class $RuleImplJsonKeys {
  static const String id = 'id';
  static const String description = 'description';
  static const String details = 'details';
  static const String color = 'color';
}

Map<String, dynamic> _$$RuleImplToJson(_$RuleImpl instance) =>
    <String, dynamic>{
      'description': instance.description,
      'details': instance.details,
      'color': colorToJson(instance.color),
    };
