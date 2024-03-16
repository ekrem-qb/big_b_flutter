// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'planned_task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PlannedTaskImpl _$$PlannedTaskImplFromJson(Map<String, dynamic> json) =>
    _$PlannedTaskImpl(
      id: json['id'] as int? ?? -1,
      text: json['text'] as String,
      deadline: DateTime.parse(json['deadline'] as String),
      isImageRequired: json['is_image_required'] as bool,
      updatedAt: DateTime.parse(json['updated_at'] as String),
      weekdays: json['weekdays'] as int,
    );

const _$$PlannedTaskImplFieldMap = <String, String>{
  'text': 'text',
  'deadline': 'deadline',
  'isImageRequired': 'is_image_required',
  'updatedAt': 'updated_at',
  'weekdays': 'weekdays',
};

Map<String, dynamic> _$$PlannedTaskImplToJson(_$PlannedTaskImpl instance) =>
    <String, dynamic>{
      'text': instance.text,
      'deadline': instance.deadline.toIso8601String(),
      'is_image_required': instance.isImageRequired,
      'updated_at': instance.updatedAt.toIso8601String(),
      'weekdays': instance.weekdays,
    };
