// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'text_line.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TextLineImpl _$$TextLineImplFromJson(Map<String, dynamic> json) =>
    _$TextLineImpl(
      time: Duration(microseconds: (json['time'] as num).toInt()),
      text: json['text'] as String,
      partsCount: (json['parts_count'] as num).toInt(),
      highlights: (json['highlights'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
      highlightColors: (json['highlight_colors'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
    );

const _$$TextLineImplFieldMap = <String, String>{
  'time': 'time',
  'text': 'text',
  'partsCount': 'parts_count',
  'highlights': 'highlights',
  'highlightColors': 'highlight_colors',
};

abstract final class $TextLineImplJsonKeys {
  static const String time = 'time';
  static const String text = 'text';
  static const String partsCount = 'parts_count';
  static const String highlights = 'highlights';
  static const String highlightColors = 'highlight_colors';
}
