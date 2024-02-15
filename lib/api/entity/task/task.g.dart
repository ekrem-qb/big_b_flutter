// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TaskImpl _$$TaskImplFromJson(Map<String, dynamic> json) => _$TaskImpl(
      id: json['id'] as int,
      text: json['text'] as String,
      isDone: json['is_done'] as bool,
      imageUrl: json['image_url'] == null
          ? null
          : Uri.parse(json['image_url'] as String),
      deadline: json['deadline'] == null
          ? null
          : DateTime.parse(json['deadline'] as String),
      delay: json['delay'] == null
          ? null
          : Duration(microseconds: json['delay'] as int),
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );

const _$$TaskImplFieldMap = <String, String>{
  'id': 'id',
  'text': 'text',
  'isDone': 'is_done',
  'imageUrl': 'image_url',
  'deadline': 'deadline',
  'delay': 'delay',
  'updatedAt': 'updated_at',
};
