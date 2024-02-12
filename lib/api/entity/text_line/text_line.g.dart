// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'text_line.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TextLineImpl _$$TextLineImplFromJson(Map<String, dynamic> json) => _$TextLineImpl(
      time: Duration(microseconds: json['time'] as int),
      text: json['text'] as String,
      partsCount: json['parts_count'] as int,
      highlights: (json['highlights'] as List<dynamic>).map((e) => e as int).toList(),
    );

const _$$TextLineImplFieldMap = <String, String>{
  'time': 'time',
  'text': 'text',
  'partsCount': 'parts_count',
  'highlights': 'highlights',
};
