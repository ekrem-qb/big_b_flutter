// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'text_line.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TextLine _$TextLineFromJson(Map<String, dynamic> json) {
  return _TextLine.fromJson(json);
}

/// @nodoc
mixin _$TextLine {
  int get id => throw _privateConstructorUsedError;

  /// Duration at which the line should be displayed
  Duration get time => throw _privateConstructorUsedError;

  /// Content of the line
  String get text => throw _privateConstructorUsedError;
  bool get isEmployee => throw _privateConstructorUsedError;

  /// Create a copy of TextLine
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TextLineCopyWith<TextLine> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TextLineCopyWith<$Res> {
  factory $TextLineCopyWith(TextLine value, $Res Function(TextLine) then) =
      _$TextLineCopyWithImpl<$Res, TextLine>;
  @useResult
  $Res call({int id, Duration time, String text, bool isEmployee});
}

/// @nodoc
class _$TextLineCopyWithImpl<$Res, $Val extends TextLine>
    implements $TextLineCopyWith<$Res> {
  _$TextLineCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TextLine
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? time = null,
    Object? text = null,
    Object? isEmployee = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as Duration,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      isEmployee: null == isEmployee
          ? _value.isEmployee
          : isEmployee // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TextLineImplCopyWith<$Res>
    implements $TextLineCopyWith<$Res> {
  factory _$$TextLineImplCopyWith(
          _$TextLineImpl value, $Res Function(_$TextLineImpl) then) =
      __$$TextLineImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, Duration time, String text, bool isEmployee});
}

/// @nodoc
class __$$TextLineImplCopyWithImpl<$Res>
    extends _$TextLineCopyWithImpl<$Res, _$TextLineImpl>
    implements _$$TextLineImplCopyWith<$Res> {
  __$$TextLineImplCopyWithImpl(
      _$TextLineImpl _value, $Res Function(_$TextLineImpl) _then)
      : super(_value, _then);

  /// Create a copy of TextLine
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? time = null,
    Object? text = null,
    Object? isEmployee = null,
  }) {
    return _then(_$TextLineImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as Duration,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      isEmployee: null == isEmployee
          ? _value.isEmployee
          : isEmployee // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable(createToJson: false)
class _$TextLineImpl implements _TextLine {
  const _$TextLineImpl(
      {required this.id,
      required this.time,
      required this.text,
      required this.isEmployee});

  factory _$TextLineImpl.fromJson(Map<String, dynamic> json) =>
      _$$TextLineImplFromJson(json);

  @override
  final int id;

  /// Duration at which the line should be displayed
  @override
  final Duration time;

  /// Content of the line
  @override
  final String text;
  @override
  final bool isEmployee;

  @override
  String toString() {
    return 'TextLine(id: $id, time: $time, text: $text, isEmployee: $isEmployee)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TextLineImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.time, time) || other.time == time) &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.isEmployee, isEmployee) ||
                other.isEmployee == isEmployee));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, time, text, isEmployee);

  /// Create a copy of TextLine
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TextLineImplCopyWith<_$TextLineImpl> get copyWith =>
      __$$TextLineImplCopyWithImpl<_$TextLineImpl>(this, _$identity);
}

abstract class _TextLine implements TextLine {
  const factory _TextLine(
      {required final int id,
      required final Duration time,
      required final String text,
      required final bool isEmployee}) = _$TextLineImpl;

  factory _TextLine.fromJson(Map<String, dynamic> json) =
      _$TextLineImpl.fromJson;

  @override
  int get id;

  /// Duration at which the line should be displayed
  @override
  Duration get time;

  /// Content of the line
  @override
  String get text;
  @override
  bool get isEmployee;

  /// Create a copy of TextLine
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TextLineImplCopyWith<_$TextLineImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
