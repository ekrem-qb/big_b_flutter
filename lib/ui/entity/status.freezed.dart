// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'status.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Status {}

/// @nodoc
abstract class $StatusCopyWith<$Res> {
  factory $StatusCopyWith(Status value, $Res Function(Status) then) =
      _$StatusCopyWithImpl<$Res, Status>;
}

/// @nodoc
class _$StatusCopyWithImpl<$Res, $Val extends Status>
    implements $StatusCopyWith<$Res> {
  _$StatusCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Status
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$StatusInitialImplCopyWith<$Res> {
  factory _$$StatusInitialImplCopyWith(
          _$StatusInitialImpl value, $Res Function(_$StatusInitialImpl) then) =
      __$$StatusInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$StatusInitialImplCopyWithImpl<$Res>
    extends _$StatusCopyWithImpl<$Res, _$StatusInitialImpl>
    implements _$$StatusInitialImplCopyWith<$Res> {
  __$$StatusInitialImplCopyWithImpl(
      _$StatusInitialImpl _value, $Res Function(_$StatusInitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of Status
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$StatusInitialImpl implements StatusInitial {
  const _$StatusInitialImpl();

  @override
  String toString() {
    return 'Status.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$StatusInitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;
}

abstract class StatusInitial implements Status {
  const factory StatusInitial() = _$StatusInitialImpl;
}

/// @nodoc
abstract class _$$StatusInProgressImplCopyWith<$Res> {
  factory _$$StatusInProgressImplCopyWith(_$StatusInProgressImpl value,
          $Res Function(_$StatusInProgressImpl) then) =
      __$$StatusInProgressImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$StatusInProgressImplCopyWithImpl<$Res>
    extends _$StatusCopyWithImpl<$Res, _$StatusInProgressImpl>
    implements _$$StatusInProgressImplCopyWith<$Res> {
  __$$StatusInProgressImplCopyWithImpl(_$StatusInProgressImpl _value,
      $Res Function(_$StatusInProgressImpl) _then)
      : super(_value, _then);

  /// Create a copy of Status
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$StatusInProgressImpl implements StatusInProgress {
  const _$StatusInProgressImpl();

  @override
  String toString() {
    return 'Status.inProgress()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$StatusInProgressImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;
}

abstract class StatusInProgress implements Status {
  const factory StatusInProgress() = _$StatusInProgressImpl;
}

/// @nodoc
abstract class _$$StatusErrorImplCopyWith<$Res> {
  factory _$$StatusErrorImplCopyWith(
          _$StatusErrorImpl value, $Res Function(_$StatusErrorImpl) then) =
      __$$StatusErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$StatusErrorImplCopyWithImpl<$Res>
    extends _$StatusCopyWithImpl<$Res, _$StatusErrorImpl>
    implements _$$StatusErrorImplCopyWith<$Res> {
  __$$StatusErrorImplCopyWithImpl(
      _$StatusErrorImpl _value, $Res Function(_$StatusErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of Status
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$StatusErrorImpl(
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$StatusErrorImpl implements StatusError {
  const _$StatusErrorImpl({required this.error});

  @override
  final String error;

  @override
  String toString() {
    return 'Status.error(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StatusErrorImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  /// Create a copy of Status
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StatusErrorImplCopyWith<_$StatusErrorImpl> get copyWith =>
      __$$StatusErrorImplCopyWithImpl<_$StatusErrorImpl>(this, _$identity);
}

abstract class StatusError implements Status {
  const factory StatusError({required final String error}) = _$StatusErrorImpl;

  String get error;

  /// Create a copy of Status
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StatusErrorImplCopyWith<_$StatusErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$StatusCompletedImplCopyWith<$Res> {
  factory _$$StatusCompletedImplCopyWith(_$StatusCompletedImpl value,
          $Res Function(_$StatusCompletedImpl) then) =
      __$$StatusCompletedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$StatusCompletedImplCopyWithImpl<$Res>
    extends _$StatusCopyWithImpl<$Res, _$StatusCompletedImpl>
    implements _$$StatusCompletedImplCopyWith<$Res> {
  __$$StatusCompletedImplCopyWithImpl(
      _$StatusCompletedImpl _value, $Res Function(_$StatusCompletedImpl) _then)
      : super(_value, _then);

  /// Create a copy of Status
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$StatusCompletedImpl implements StatusCompleted {
  const _$StatusCompletedImpl();

  @override
  String toString() {
    return 'Status.completed()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$StatusCompletedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;
}

abstract class StatusCompleted implements Status {
  const factory StatusCompleted() = _$StatusCompletedImpl;
}

