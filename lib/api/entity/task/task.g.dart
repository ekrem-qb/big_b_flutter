// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TaskImpl _$$TaskImplFromJson(Map<String, dynamic> json) => _$TaskImpl(
  id: (json['id'] as num).toInt(),
  text: json['text'] as String,
  isDone: json['is_done'] as bool,
  updatedAt: DateTime.parse(json['updated_at'] as String).toLocal(),
  deadline: DateTime.parse(json['deadline'] as String).toLocal(),
  delay: Duration(microseconds: (json['delay'] as num).toInt()),
  isImageRequired: json['is_image_required'] as bool,
  imageUrl:
      json['image_url'] == null ? null : Uri.parse(json['image_url'] as String),
  executives:
      (json['executives'] as List<dynamic>)
          .map((e) => Profile.fromJson(e as Map<String, dynamic>))
          .toList(),
);

const _$$TaskImplFieldMap = <String, String>{
  'id': 'id',
  'text': 'text',
  'isDone': 'is_done',
  'updatedAt': 'updated_at',
  'deadline': 'deadline',
  'delay': 'delay',
  'isImageRequired': 'is_image_required',
  'imageUrl': 'image_url',
  'executives': 'executives',
};

abstract final class $TaskImplJsonKeys {
  static const String id = 'id';
  static const String text = 'text';
  static const String isDone = 'is_done';
  static const String updatedAt = 'updated_at';
  static const String deadline = 'deadline';
  static const String delay = 'delay';
  static const String isImageRequired = 'is_image_required';
  static const String imageUrl = 'image_url';
  static const String executives = 'executives';
}

Map<String, dynamic> _$$TaskImplToJson(_$TaskImpl instance) =>
    <String, dynamic>{
      'text': instance.text,
      'is_done': instance.isDone,
      'updated_at': instance.updatedAt.toUtc().toIso8601String(),
      'deadline': instance.deadline.toUtc().toIso8601String(),
      'delay': instance.delay.inMicroseconds,
      'is_image_required': instance.isImageRequired,
      'image_url': instance.imageUrl?.toString(),
    };
