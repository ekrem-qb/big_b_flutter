import 'dart:typed_data';

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../extensions/uint8_list_converter.dart';

part 'home_state.freezed.dart';
part 'home_state.g.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    @Uint8ListConverter() required final Uint8List history,
  }) = _HomeState;

  factory HomeState.fromJson(final Map<String, dynamic> json) => _$HomeStateFromJson(json);
}
