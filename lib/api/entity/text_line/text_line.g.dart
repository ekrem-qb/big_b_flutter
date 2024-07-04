// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'text_line.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TextLineImpl _$$TextLineImplFromJson(Map<String, dynamic> json) =>
    _$TextLineImpl(
      time: Duration(microseconds: (json['time'] as num).toInt()),
      text: json['text'] as String,
      highlights: (json['highlights'] as List<dynamic>)
          .map((e) => Highlight.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

const _$$TextLineImplFieldMap = <String, String>{
  'time': 'time',
  'text': 'text',
  'highlights': 'highlights',
};

abstract final class $TextLineImplJsonKeys {
  static const String time = 'time';
  static const String text = 'text';
  static const String highlights = 'highlights';
}
