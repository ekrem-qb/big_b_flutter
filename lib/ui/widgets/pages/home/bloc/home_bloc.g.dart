// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_bloc.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HomeStateImpl _$$HomeStateImplFromJson(Map<String, dynamic> json) =>
    _$HomeStateImpl(
      selectedTabIndex: (json['selected_tab_index'] as num?)?.toInt() ?? 0,
    );

const _$$HomeStateImplFieldMap = <String, String>{
  'selectedTabIndex': 'selected_tab_index',
};

abstract final class $HomeStateImplJsonKeys {
  static const String selectedTabIndex = 'selected_tab_index';
}

Map<String, dynamic> _$$HomeStateImplToJson(_$HomeStateImpl instance) =>
    <String, dynamic>{
      'selected_tab_index': instance.selectedTabIndex,
    };
