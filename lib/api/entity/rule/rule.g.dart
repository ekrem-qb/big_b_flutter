// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rule.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WordsRuleImpl _$$WordsRuleImplFromJson(Map<String, dynamic> json) =>
    _$WordsRuleImpl(
      id: (json['id'] as num).toInt(),
      words: (json['words'] as List<dynamic>).map((e) => e as String).toSet(),
      color: Color((json['color'] as num).toInt()),
      $type: json['type'] as String?,
    );

const _$$WordsRuleImplFieldMap = <String, String>{
  'id': 'id',
  'words': 'words',
  'color': 'color',
  r'$type': 'type',
};

abstract final class $WordsRuleImplJsonKeys {
  static const String id = 'id';
  static const String words = 'words';
  static const String color = 'color';
  static const String $type = 'type';
}

Map<String, dynamic> _$$WordsRuleImplToJson(_$WordsRuleImpl instance) =>
    <String, dynamic>{
      'words': instance.words.toList(),
      'color': colorToJson(instance.color),
      'type': instance.$type,
    };

_$NameRuleImpl _$$NameRuleImplFromJson(Map<String, dynamic> json) =>
    _$NameRuleImpl(
      id: (json['id'] as num).toInt(),
      color: Color((json['color'] as num).toInt()),
      $type: json['type'] as String?,
    );

const _$$NameRuleImplFieldMap = <String, String>{
  'id': 'id',
  'color': 'color',
  r'$type': 'type',
};

abstract final class $NameRuleImplJsonKeys {
  static const String id = 'id';
  static const String color = 'color';
  static const String $type = 'type';
}

Map<String, dynamic> _$$NameRuleImplToJson(_$NameRuleImpl instance) =>
    <String, dynamic>{
      'color': colorToJson(instance.color),
      'type': instance.$type,
    };

_$CustomRuleImpl _$$CustomRuleImplFromJson(Map<String, dynamic> json) =>
    _$CustomRuleImpl(
      id: (json['id'] as num).toInt(),
      description: json['description'] as String,
      details: json['details'] as String,
      color: Color((json['color'] as num).toInt()),
      $type: json['type'] as String?,
    );

const _$$CustomRuleImplFieldMap = <String, String>{
  'id': 'id',
  'description': 'description',
  'details': 'details',
  'color': 'color',
  r'$type': 'type',
};

abstract final class $CustomRuleImplJsonKeys {
  static const String id = 'id';
  static const String description = 'description';
  static const String details = 'details';
  static const String color = 'color';
  static const String $type = 'type';
}

Map<String, dynamic> _$$CustomRuleImplToJson(_$CustomRuleImpl instance) =>
    <String, dynamic>{
      'description': instance.description,
      'details': instance.details,
      'color': colorToJson(instance.color),
      'type': instance.$type,
    };
