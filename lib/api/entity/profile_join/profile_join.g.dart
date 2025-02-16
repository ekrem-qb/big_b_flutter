// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_join.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProfileJoinImpl _$$ProfileJoinImplFromJson(Map<String, dynamic> json) =>
    _$ProfileJoinImpl(
      id: (json['id'] as num).toInt(),
      profile: json['profile'] as String,
    );

const _$$ProfileJoinImplFieldMap = <String, String>{
  'id': 'id',
  'profile': 'profile',
};

abstract final class $ProfileJoinImplJsonKeys {
  static const String id = 'id';
  static const String profile = 'profile';
}

Map<String, dynamic> _$$ProfileJoinImplToJson(_$ProfileJoinImpl instance) =>
    <String, dynamic>{'id': instance.id, 'profile': instance.profile};
