// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'text_line.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TextLineImpl _$$TextLineImplFromJson(Map<String, dynamic> json) =>
    _$TextLineImpl(
      time: Duration(microseconds: (json['time'] as num).toInt()),
      text: json['text'] as String,
      isEmployee: json['is_employee'] as bool,
      highlights: (json['highlights'] as List<dynamic>)
          .map((e) => Highlight.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

const _$$TextLineImplFieldMap = <String, String>{
  'time': 'time',
  'text': 'text',
  'isEmployee': 'is_employee',
  'highlights': 'highlights',
};

abstract final class $TextLineImplJsonKeys {
  static const String time = 'time';
  static const String text = 'text';
  static const String isEmployee = 'is_employee';
  static const String highlights = 'highlights';
}
