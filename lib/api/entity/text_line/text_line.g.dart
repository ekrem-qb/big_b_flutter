// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'text_line.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TextLineImpl _$$TextLineImplFromJson(Map<String, dynamic> json) =>
    _$TextLineImpl(
      id: (json['id'] as num).toInt(),
      time: Duration(microseconds: (json['time'] as num).toInt()),
      text: json['text'] as String,
      isEmployee: json['is_employee'] as bool,
    );

const _$$TextLineImplFieldMap = <String, String>{
  'id': 'id',
  'time': 'time',
  'text': 'text',
  'isEmployee': 'is_employee',
};

abstract final class $TextLineImplJsonKeys {
  static const String id = 'id';
  static const String time = 'time';
  static const String text = 'text';
  static const String isEmployee = 'is_employee';
}
