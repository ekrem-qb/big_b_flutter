// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'planned_task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PlannedTaskImpl _$$PlannedTaskImplFromJson(Map<String, dynamic> json) =>
    _$PlannedTaskImpl(
      id: (json['id'] as num).toInt(),
      text: json['text'] as String,
      deadline: DateTime.parse(json['deadline'] as String).toLocal(),
      isImageRequired: json['is_image_required'] as bool,
      updatedAt: DateTime.parse(json['updated_at'] as String).toLocal(),
      weekdays: (json['weekdays'] as num).toInt(),
      executives: (json['executives'] as List<dynamic>)
          .map((e) => Profile.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

const _$$PlannedTaskImplFieldMap = <String, String>{
  'id': 'id',
  'text': 'text',
  'deadline': 'deadline',
  'isImageRequired': 'is_image_required',
  'updatedAt': 'updated_at',
  'weekdays': 'weekdays',
  'executives': 'executives',
};

abstract final class $PlannedTaskImplJsonKeys {
  static const String id = 'id';
  static const String text = 'text';
  static const String deadline = 'deadline';
  static const String isImageRequired = 'is_image_required';
  static const String updatedAt = 'updated_at';
  static const String weekdays = 'weekdays';
  static const String executives = 'executives';
}

Map<String, dynamic> _$$PlannedTaskImplToJson(_$PlannedTaskImpl instance) =>
    <String, dynamic>{
      'text': instance.text,
      'deadline': instance.deadline.toUtc().toIso8601String(),
      'is_image_required': instance.isImageRequired,
      'updated_at': instance.updatedAt.toUtc().toIso8601String(),
      'weekdays': instance.weekdays,
    };
