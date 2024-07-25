// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_bloc.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HomeStateImpl _$$HomeStateImplFromJson(Map<String, dynamic> json) =>
    _$HomeStateImpl(
      selectedTabIndex: (json['selected_tab_index'] as num?)?.toInt() ?? 0,
      authStatus:
          $enumDecodeNullable(_$AuthStatusEnumMap, json['auth_status']) ??
              AuthStatus.signedIn,
    );

const _$$HomeStateImplFieldMap = <String, String>{
  'selectedTabIndex': 'selected_tab_index',
  'authStatus': 'auth_status',
};

abstract final class $HomeStateImplJsonKeys {
  static const String selectedTabIndex = 'selected_tab_index';
  static const String authStatus = 'auth_status';
}

Map<String, dynamic> _$$HomeStateImplToJson(_$HomeStateImpl instance) =>
    <String, dynamic>{
      'selected_tab_index': instance.selectedTabIndex,
      'auth_status': _$AuthStatusEnumMap[instance.authStatus]!,
    };

const _$AuthStatusEnumMap = {
  AuthStatus.signedIn: 'signedIn',
  AuthStatus.signedOut: 'signedOut',
};
