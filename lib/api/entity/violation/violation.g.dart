// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'violation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NormalViolationImpl _$$NormalViolationImplFromJson(
  Map<String, dynamic> json,
) => _$NormalViolationImpl(
  id: (json['id'] as num).toInt(),
  rule: Rule.fromJson(json['rule'] as Map<String, dynamic>),
  record: Recording.fromJson(json['record'] as Map<String, dynamic>),
  $type: json['type'] as String?,
);

const _$$NormalViolationImplFieldMap = <String, String>{
  'id': 'id',
  'rule': 'rule',
  'record': 'record',
  r'$type': 'type',
};

abstract final class $NormalViolationImplJsonKeys {
  static const String id = 'id';
  static const String rule = 'rule';
  static const String record = 'record';
  static const String $type = 'type';
}

_$HighlightViolationImpl _$$HighlightViolationImplFromJson(
  Map<String, dynamic> json,
) => _$HighlightViolationImpl(
  id: (json['id'] as num).toInt(),
  rule: Rule.fromJson(json['rule'] as Map<String, dynamic>),
  record: Recording.fromJson(json['record'] as Map<String, dynamic>),
  line: TextLine.fromJson(json['line'] as Map<String, dynamic>),
  startIndex: (json['start_index'] as num).toInt(),
  endIndex: (json['end_index'] as num).toInt(),
  $type: json['type'] as String?,
);

const _$$HighlightViolationImplFieldMap = <String, String>{
  'id': 'id',
  'rule': 'rule',
  'record': 'record',
  'line': 'line',
  'startIndex': 'start_index',
  'endIndex': 'end_index',
  r'$type': 'type',
};

abstract final class $HighlightViolationImplJsonKeys {
  static const String id = 'id';
  static const String rule = 'rule';
  static const String record = 'record';
  static const String line = 'line';
  static const String startIndex = 'start_index';
  static const String endIndex = 'end_index';
  static const String $type = 'type';
}
