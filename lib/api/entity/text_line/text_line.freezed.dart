// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'text_line.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError('It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TextLine _$TextLineFromJson(Map<String, dynamic> json) {
  return _TextLine.fromJson(json);
}

/// @nodoc
mixin _$TextLine {
  /// Duration at which the line should be displayed
  Duration get time => throw _privateConstructorUsedError;

  /// Content of the line
  String get text => throw _privateConstructorUsedError;
  int get partsCount => throw _privateConstructorUsedError;
  List<int> get highlights => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TextLineCopyWith<TextLine> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TextLineCopyWith<$Res> {
  factory $TextLineCopyWith(TextLine value, $Res Function(TextLine) then) = _$TextLineCopyWithImpl<$Res, TextLine>;
  @useResult
  $Res call({Duration time, String text, int partsCount, List<int> highlights});
}

/// @nodoc
class _$TextLineCopyWithImpl<$Res, $Val extends TextLine> implements $TextLineCopyWith<$Res> {
  _$TextLineCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? time = null,
    Object? text = null,
    Object? partsCount = null,
    Object? highlights = null,
  }) {
    return _then(_value.copyWith(
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as Duration,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      partsCount: null == partsCount
          ? _value.partsCount
          : partsCount // ignore: cast_nullable_to_non_nullable
              as int,
      highlights: null == highlights
          ? _value.highlights
          : highlights // ignore: cast_nullable_to_non_nullable
              as List<int>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TextLineImplCopyWith<$Res> implements $TextLineCopyWith<$Res> {
  factory _$$TextLineImplCopyWith(_$TextLineImpl value, $Res Function(_$TextLineImpl) then) = __$$TextLineImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Duration time, String text, int partsCount, List<int> highlights});
}

/// @nodoc
class __$$TextLineImplCopyWithImpl<$Res> extends _$TextLineCopyWithImpl<$Res, _$TextLineImpl> implements _$$TextLineImplCopyWith<$Res> {
  __$$TextLineImplCopyWithImpl(_$TextLineImpl _value, $Res Function(_$TextLineImpl) _then) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? time = null,
    Object? text = null,
    Object? partsCount = null,
    Object? highlights = null,
  }) {
    return _then(_$TextLineImpl(
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as Duration,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      partsCount: null == partsCount
          ? _value.partsCount
          : partsCount // ignore: cast_nullable_to_non_nullable
              as int,
      highlights: null == highlights
          ? _value._highlights
          : highlights // ignore: cast_nullable_to_non_nullable
              as List<int>,
    ));
  }
}

/// @nodoc
@JsonSerializable(createToJson: false)
class _$TextLineImpl implements _TextLine {
  const _$TextLineImpl({required this.time, required this.text, required this.partsCount, required final List<int> highlights}) : _highlights = highlights;

  factory _$TextLineImpl.fromJson(Map<String, dynamic> json) => _$$TextLineImplFromJson(json);

  /// Duration at which the line should be displayed
  @override
  final Duration time;

  /// Content of the line
  @override
  final String text;
  @override
  final int partsCount;
  final List<int> _highlights;
  @override
  List<int> get highlights {
    if (_highlights is EqualUnmodifiableListView) return _highlights;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_highlights);
  }

  @override
  String toString() {
    return 'TextLine(time: $time, text: $text, partsCount: $partsCount, highlights: $highlights)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType && other is _$TextLineImpl && (identical(other.time, time) || other.time == time) && (identical(other.text, text) || other.text == text) && (identical(other.partsCount, partsCount) || other.partsCount == partsCount) && const DeepCollectionEquality().equals(other._highlights, _highlights));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, time, text, partsCount, const DeepCollectionEquality().hash(_highlights));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TextLineImplCopyWith<_$TextLineImpl> get copyWith => __$$TextLineImplCopyWithImpl<_$TextLineImpl>(this, _$identity);
}

abstract class _TextLine implements TextLine {
  const factory _TextLine({required final Duration time, required final String text, required final int partsCount, required final List<int> highlights}) = _$TextLineImpl;

  factory _TextLine.fromJson(Map<String, dynamic> json) = _$TextLineImpl.fromJson;

  @override

  /// Duration at which the line should be displayed
  Duration get time;
  @override

  /// Content of the line
  String get text;
  @override
  int get partsCount;
  @override
  List<int> get highlights;
  @override
  @JsonKey(ignore: true)
  _$$TextLineImplCopyWith<_$TextLineImpl> get copyWith => throw _privateConstructorUsedError;
}
