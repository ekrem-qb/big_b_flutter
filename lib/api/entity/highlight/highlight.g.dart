// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'highlight.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HighlightImpl _$$HighlightImplFromJson(Map<String, dynamic> json) =>
    _$HighlightImpl(
      id: (json['id'] as num).toInt(),
      startIndex: (json['start_index'] as num).toInt(),
      endIndex: (json['end_index'] as num).toInt(),
      type: (json['type'] as num).toInt(),
    );

const _$$HighlightImplFieldMap = <String, String>{
  'id': 'id',
  'startIndex': 'start_index',
  'endIndex': 'end_index',
  'type': 'type',
};

abstract final class $HighlightImplJsonKeys {
  static const String id = 'id';
  static const String startIndex = 'start_index';
  static const String endIndex = 'end_index';
  static const String type = 'type';
}
