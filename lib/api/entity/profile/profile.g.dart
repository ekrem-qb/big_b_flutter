// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProfileImpl _$$ProfileImplFromJson(Map<String, dynamic> json) =>
    _$ProfileImpl(
      uid: json['uid'] as String,
      name: json['name'] as String,
      login: _removeMail(json['login'] as String),
      role: $enumDecode(_$RoleEnumMap, json['role']),
      createdAt: DateTime.parse(json['created_at'] as String).toLocal(),
      isDeleted: json['is_deleted'] as bool? ?? false,
    );

const _$$ProfileImplFieldMap = <String, String>{
  'uid': 'uid',
  'name': 'name',
  'login': 'login',
  'role': 'role',
  'createdAt': 'created_at',
  'isDeleted': 'is_deleted',
};

abstract final class $ProfileImplJsonKeys {
  static const String uid = 'uid';
  static const String name = 'name';
  static const String login = 'login';
  static const String role = 'role';
  static const String createdAt = 'created_at';
  static const String isDeleted = 'is_deleted';
}

Map<String, dynamic> _$$ProfileImplToJson(_$ProfileImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'role': _$RoleEnumMap[instance.role]!,
    };

const _$RoleEnumMap = {
  Role.employee: 'employee',
  Role.manager: 'manager',
};
