// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recording.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RecordingImpl _$$RecordingImplFromJson(Map<String, dynamic> json) =>
    _$RecordingImpl(
      id: (json['id'] as num).toInt(),
      audioUrl: Uri.parse(json['url'] as String),
      hasLines: json['has_lines'] as bool,
      createdAt: DateTime.parse(json['created_at'] as String).toLocal(),
    );

const _$$RecordingImplFieldMap = <String, String>{
  'id': 'id',
  'audioUrl': 'url',
  'hasLines': 'has_lines',
  'createdAt': 'created_at',
};

abstract final class $RecordingImplJsonKeys {
  static const String id = 'id';
  static const String audioUrl = 'url';
  static const String hasLines = 'has_lines';
  static const String createdAt = 'created_at';
}
