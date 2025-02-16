// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HomeStateImpl _$$HomeStateImplFromJson(Map<String, dynamic> json) =>
    _$HomeStateImpl(
      history: const Uint8ListConverter().fromJson(
        json['history'] as Uint8List,
      ),
    );

const _$$HomeStateImplFieldMap = <String, String>{'history': 'history'};

abstract final class $HomeStateImplJsonKeys {
  static const String history = 'history';
}

Map<String, dynamic> _$$HomeStateImplToJson(_$HomeStateImpl instance) =>
    <String, dynamic>{
      'history': const Uint8ListConverter().toJson(instance.history),
    };
