// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TaskImpl _$$TaskImplFromJson(Map<String, dynamic> json) => _$TaskImpl(
      id: json['id'] as int,
      text: json['text'] as String,
      isDone: json['is_done'] as bool,
      updatedAt: DateTime.parse(json['updated_at'] as String),
      deadline: DateTime.parse(json['deadline'] as String),
      delay: Duration(microseconds: json['delay'] as int),
      isImageRequired: json['is_image_required'] as bool,
      imageUrl: json['image_url'] == null
          ? null
          : Uri.parse(json['image_url'] as String),
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
};

Map<String, dynamic> _$$TaskImplToJson(_$TaskImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'text': instance.text,
      'is_done': instance.isDone,
      'updated_at': instance.updatedAt.toIso8601String(),
      'deadline': instance.deadline.toIso8601String(),
      'delay': instance.delay.inMicroseconds,
      'is_image_required': instance.isImageRequired,
      'image_url': instance.imageUrl?.toString(),
    };
