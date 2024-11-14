import 'dart:typed_data';

import 'package:freezed_annotation/freezed_annotation.dart';

class Uint8ListConverter extends JsonConverter<Uint8List, Uint8List> {
  const Uint8ListConverter();

  @override
  Uint8List fromJson(final Uint8List json) => json;

  @override
  Uint8List toJson(final Uint8List object) => object;
}
