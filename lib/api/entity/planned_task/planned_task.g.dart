// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'planned_task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PlannedTaskImpl _$$PlannedTaskImplFromJson(Map<String, dynamic> json) =>
    _$PlannedTaskImpl(
      id: json['id'] as int? ?? -1,
      task: Task.fromJson(json['task'] as Map<String, dynamic>),
      time: Duration(microseconds: json['time'] as int),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      weekdays: json['weekdays'] as int,
    );

const _$$PlannedTaskImplFieldMap = <String, String>{
  'task': 'task',
  'time': 'time',
  'updatedAt': 'updated_at',
  'weekdays': 'weekdays',
};

Map<String, dynamic> _$$PlannedTaskImplToJson(_$PlannedTaskImpl instance) =>
    <String, dynamic>{
      'task': instance.task,
      'time': instance.time.inMicroseconds,
      'updated_at': instance.updatedAt.toIso8601String(),
      'weekdays': instance.weekdays,
    };
