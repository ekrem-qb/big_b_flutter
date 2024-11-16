// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recording.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RecordingImpl _$$RecordingImplFromJson(Map<String, dynamic> json) =>
    _$RecordingImpl(
      id: (json['id'] as num).toInt(),
      audioUrl: json['url'] as String,
      processed: $enumDecode(_$ProcessingEnumMap, json['processed']),
      createdAt: DateTime.parse(json['created_at'] as String).toLocal(),
      employee: Profile.fromJson(json['employee'] as Map<String, dynamic>),
    );

const _$$RecordingImplFieldMap = <String, String>{
  'id': 'id',
  'audioUrl': 'url',
  'processed': 'processed',
  'createdAt': 'created_at',
  'employee': 'employee',
};

abstract final class $RecordingImplJsonKeys {
  static const String id = 'id';
  static const String audioUrl = 'url';
  static const String processed = 'processed';
  static const String createdAt = 'created_at';
  static const String employee = 'employee';
}

const _$ProcessingEnumMap = {
  Processing.none: 'none',
  Processing.onlyText: 'onlyText',
  Processing.textAndViolations: 'textAndViolations',
};
