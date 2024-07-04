// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'highlight.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Highlight _$HighlightFromJson(Map<String, dynamic> json) {
  return _Highlight.fromJson(json);
}

/// @nodoc
mixin _$Highlight {
  int get id => throw _privateConstructorUsedError;
  int get startIndex => throw _privateConstructorUsedError;
  int get endIndex => throw _privateConstructorUsedError;
  int get type => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HighlightCopyWith<Highlight> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HighlightCopyWith<$Res> {
  factory $HighlightCopyWith(Highlight value, $Res Function(Highlight) then) =
      _$HighlightCopyWithImpl<$Res, Highlight>;
  @useResult
  $Res call({int id, int startIndex, int endIndex, int type});
}

/// @nodoc
class _$HighlightCopyWithImpl<$Res, $Val extends Highlight>
    implements $HighlightCopyWith<$Res> {
  _$HighlightCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? startIndex = null,
    Object? endIndex = null,
    Object? type = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      startIndex: null == startIndex
          ? _value.startIndex
          : startIndex // ignore: cast_nullable_to_non_nullable
              as int,
      endIndex: null == endIndex
          ? _value.endIndex
          : endIndex // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HighlightImplCopyWith<$Res>
    implements $HighlightCopyWith<$Res> {
  factory _$$HighlightImplCopyWith(
          _$HighlightImpl value, $Res Function(_$HighlightImpl) then) =
      __$$HighlightImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, int startIndex, int endIndex, int type});
}

/// @nodoc
class __$$HighlightImplCopyWithImpl<$Res>
    extends _$HighlightCopyWithImpl<$Res, _$HighlightImpl>
    implements _$$HighlightImplCopyWith<$Res> {
  __$$HighlightImplCopyWithImpl(
      _$HighlightImpl _value, $Res Function(_$HighlightImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? startIndex = null,
    Object? endIndex = null,
    Object? type = null,
  }) {
    return _then(_$HighlightImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      startIndex: null == startIndex
          ? _value.startIndex
          : startIndex // ignore: cast_nullable_to_non_nullable
              as int,
      endIndex: null == endIndex
          ? _value.endIndex
          : endIndex // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable(createToJson: false)
class _$HighlightImpl implements _Highlight {
  _$HighlightImpl(
      {required this.id,
      required this.startIndex,
      required this.endIndex,
      required this.type});

  factory _$HighlightImpl.fromJson(Map<String, dynamic> json) =>
      _$$HighlightImplFromJson(json);

  @override
  final int id;
  @override
  final int startIndex;
  @override
  final int endIndex;
  @override
  final int type;

  @override
  String toString() {
    return 'Highlight(id: $id, startIndex: $startIndex, endIndex: $endIndex, type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HighlightImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.startIndex, startIndex) ||
                other.startIndex == startIndex) &&
            (identical(other.endIndex, endIndex) ||
                other.endIndex == endIndex) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, startIndex, endIndex, type);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HighlightImplCopyWith<_$HighlightImpl> get copyWith =>
      __$$HighlightImplCopyWithImpl<_$HighlightImpl>(this, _$identity);
}

abstract class _Highlight implements Highlight {
  factory _Highlight(
      {required final int id,
      required final int startIndex,
      required final int endIndex,
      required final int type}) = _$HighlightImpl;

  factory _Highlight.fromJson(Map<String, dynamic> json) =
      _$HighlightImpl.fromJson;

  @override
  int get id;
  @override
  int get startIndex;
  @override
  int get endIndex;
  @override
  int get type;
  @override
  @JsonKey(ignore: true)
  _$$HighlightImplCopyWith<_$HighlightImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
