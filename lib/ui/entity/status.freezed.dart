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
mixin _$OperationStatus<E> {}

/// @nodoc
abstract class $OperationStatusCopyWith<E, $Res> {
  factory $OperationStatusCopyWith(
          OperationStatus<E> value, $Res Function(OperationStatus<E>) then) =
      _$OperationStatusCopyWithImpl<E, $Res, OperationStatus<E>>;
}

/// @nodoc
class _$OperationStatusCopyWithImpl<E, $Res, $Val extends OperationStatus<E>>
    implements $OperationStatusCopyWith<E, $Res> {
  _$OperationStatusCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OperationStatus
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$OperationStatusInitialImplCopyWith<E, $Res> {
  factory _$$OperationStatusInitialImplCopyWith(
          _$OperationStatusInitialImpl<E> value,
          $Res Function(_$OperationStatusInitialImpl<E>) then) =
      __$$OperationStatusInitialImplCopyWithImpl<E, $Res>;
}

/// @nodoc
class __$$OperationStatusInitialImplCopyWithImpl<E, $Res>
    extends _$OperationStatusCopyWithImpl<E, $Res,
        _$OperationStatusInitialImpl<E>>
    implements _$$OperationStatusInitialImplCopyWith<E, $Res> {
  __$$OperationStatusInitialImplCopyWithImpl(
      _$OperationStatusInitialImpl<E> _value,
      $Res Function(_$OperationStatusInitialImpl<E>) _then)
      : super(_value, _then);

  /// Create a copy of OperationStatus
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$OperationStatusInitialImpl<E> implements OperationStatusInitial<E> {
  const _$OperationStatusInitialImpl();

  @override
  String toString() {
    return 'OperationStatus<$E>.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OperationStatusInitialImpl<E>);
  }

  @override
  int get hashCode => runtimeType.hashCode;
}

abstract class OperationStatusInitial<E> implements OperationStatus<E> {
  const factory OperationStatusInitial() = _$OperationStatusInitialImpl<E>;
}

/// @nodoc
abstract class _$$OperationStatusInProgressImplCopyWith<E, $Res> {
  factory _$$OperationStatusInProgressImplCopyWith(
          _$OperationStatusInProgressImpl<E> value,
          $Res Function(_$OperationStatusInProgressImpl<E>) then) =
      __$$OperationStatusInProgressImplCopyWithImpl<E, $Res>;
}

/// @nodoc
class __$$OperationStatusInProgressImplCopyWithImpl<E, $Res>
    extends _$OperationStatusCopyWithImpl<E, $Res,
        _$OperationStatusInProgressImpl<E>>
    implements _$$OperationStatusInProgressImplCopyWith<E, $Res> {
  __$$OperationStatusInProgressImplCopyWithImpl(
      _$OperationStatusInProgressImpl<E> _value,
      $Res Function(_$OperationStatusInProgressImpl<E>) _then)
      : super(_value, _then);

  /// Create a copy of OperationStatus
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$OperationStatusInProgressImpl<E>
    implements OperationStatusInProgress<E> {
  const _$OperationStatusInProgressImpl();

  @override
  String toString() {
    return 'OperationStatus<$E>.inProgress()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OperationStatusInProgressImpl<E>);
  }

  @override
  int get hashCode => runtimeType.hashCode;
}

abstract class OperationStatusInProgress<E> implements OperationStatus<E> {
  const factory OperationStatusInProgress() =
      _$OperationStatusInProgressImpl<E>;
}

/// @nodoc
abstract class _$$OperationStatusErrorImplCopyWith<E, $Res> {
  factory _$$OperationStatusErrorImplCopyWith(
          _$OperationStatusErrorImpl<E> value,
          $Res Function(_$OperationStatusErrorImpl<E>) then) =
      __$$OperationStatusErrorImplCopyWithImpl<E, $Res>;
  @useResult
  $Res call({E error});
}

/// @nodoc
class __$$OperationStatusErrorImplCopyWithImpl<E, $Res>
    extends _$OperationStatusCopyWithImpl<E, $Res,
        _$OperationStatusErrorImpl<E>>
    implements _$$OperationStatusErrorImplCopyWith<E, $Res> {
  __$$OperationStatusErrorImplCopyWithImpl(_$OperationStatusErrorImpl<E> _value,
      $Res Function(_$OperationStatusErrorImpl<E>) _then)
      : super(_value, _then);

  /// Create a copy of OperationStatus
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = freezed,
  }) {
    return _then(_$OperationStatusErrorImpl<E>(
      freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as E,
    ));
  }
}

/// @nodoc

class _$OperationStatusErrorImpl<E> implements OperationStatusError<E> {
  const _$OperationStatusErrorImpl(this.error);

  @override
  final E error;

  @override
  String toString() {
    return 'OperationStatus<$E>.error(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OperationStatusErrorImpl<E> &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(error));

  /// Create a copy of OperationStatus
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OperationStatusErrorImplCopyWith<E, _$OperationStatusErrorImpl<E>>
      get copyWith => __$$OperationStatusErrorImplCopyWithImpl<E,
          _$OperationStatusErrorImpl<E>>(this, _$identity);
}

abstract class OperationStatusError<E> implements OperationStatus<E> {
  const factory OperationStatusError(final E error) =
      _$OperationStatusErrorImpl<E>;

  E get error;

  /// Create a copy of OperationStatus
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OperationStatusErrorImplCopyWith<E, _$OperationStatusErrorImpl<E>>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$OperationStatusCompletedImplCopyWith<E, $Res> {
  factory _$$OperationStatusCompletedImplCopyWith(
          _$OperationStatusCompletedImpl<E> value,
          $Res Function(_$OperationStatusCompletedImpl<E>) then) =
      __$$OperationStatusCompletedImplCopyWithImpl<E, $Res>;
}

/// @nodoc
class __$$OperationStatusCompletedImplCopyWithImpl<E, $Res>
    extends _$OperationStatusCopyWithImpl<E, $Res,
        _$OperationStatusCompletedImpl<E>>
    implements _$$OperationStatusCompletedImplCopyWith<E, $Res> {
  __$$OperationStatusCompletedImplCopyWithImpl(
      _$OperationStatusCompletedImpl<E> _value,
      $Res Function(_$OperationStatusCompletedImpl<E>) _then)
      : super(_value, _then);

  /// Create a copy of OperationStatus
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$OperationStatusCompletedImpl<E> implements OperationStatusCompleted<E> {
  const _$OperationStatusCompletedImpl();

  @override
  String toString() {
    return 'OperationStatus<$E>.completed()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OperationStatusCompletedImpl<E>);
  }

  @override
  int get hashCode => runtimeType.hashCode;
}

abstract class OperationStatusCompleted<E> implements OperationStatus<E> {
  const factory OperationStatusCompleted() = _$OperationStatusCompletedImpl<E>;
}

/// @nodoc
mixin _$Status<E> {}

/// @nodoc
abstract class $StatusCopyWith<E, $Res> {
  factory $StatusCopyWith(Status<E> value, $Res Function(Status<E>) then) =
      _$StatusCopyWithImpl<E, $Res, Status<E>>;
}

/// @nodoc
class _$StatusCopyWithImpl<E, $Res, $Val extends Status<E>>
    implements $StatusCopyWith<E, $Res> {
  _$StatusCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Status
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$StatusLoadingImplCopyWith<E, $Res> {
  factory _$$StatusLoadingImplCopyWith(_$StatusLoadingImpl<E> value,
          $Res Function(_$StatusLoadingImpl<E>) then) =
      __$$StatusLoadingImplCopyWithImpl<E, $Res>;
}

/// @nodoc
class __$$StatusLoadingImplCopyWithImpl<E, $Res>
    extends _$StatusCopyWithImpl<E, $Res, _$StatusLoadingImpl<E>>
    implements _$$StatusLoadingImplCopyWith<E, $Res> {
  __$$StatusLoadingImplCopyWithImpl(_$StatusLoadingImpl<E> _value,
      $Res Function(_$StatusLoadingImpl<E>) _then)
      : super(_value, _then);

  /// Create a copy of Status
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$StatusLoadingImpl<E> implements StatusLoading<E> {
  const _$StatusLoadingImpl();

  @override
  String toString() {
    return 'Status<$E>.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$StatusLoadingImpl<E>);
  }

  @override
  int get hashCode => runtimeType.hashCode;
}

abstract class StatusLoading<E> implements Status<E> {
  const factory StatusLoading() = _$StatusLoadingImpl<E>;
}

/// @nodoc
abstract class _$$StatusErrorImplCopyWith<E, $Res> {
  factory _$$StatusErrorImplCopyWith(_$StatusErrorImpl<E> value,
          $Res Function(_$StatusErrorImpl<E>) then) =
      __$$StatusErrorImplCopyWithImpl<E, $Res>;
  @useResult
  $Res call({E error});
}

/// @nodoc
class __$$StatusErrorImplCopyWithImpl<E, $Res>
    extends _$StatusCopyWithImpl<E, $Res, _$StatusErrorImpl<E>>
    implements _$$StatusErrorImplCopyWith<E, $Res> {
  __$$StatusErrorImplCopyWithImpl(
      _$StatusErrorImpl<E> _value, $Res Function(_$StatusErrorImpl<E>) _then)
      : super(_value, _then);

  /// Create a copy of Status
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = freezed,
  }) {
    return _then(_$StatusErrorImpl<E>(
      freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as E,
    ));
  }
}

/// @nodoc

class _$StatusErrorImpl<E> implements StatusError<E> {
  const _$StatusErrorImpl(this.error);

  @override
  final E error;

  @override
  String toString() {
    return 'Status<$E>.error(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StatusErrorImpl<E> &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(error));

  /// Create a copy of Status
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StatusErrorImplCopyWith<E, _$StatusErrorImpl<E>> get copyWith =>
      __$$StatusErrorImplCopyWithImpl<E, _$StatusErrorImpl<E>>(
          this, _$identity);
}

abstract class StatusError<E> implements Status<E> {
  const factory StatusError(final E error) = _$StatusErrorImpl<E>;

  E get error;

  /// Create a copy of Status
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StatusErrorImplCopyWith<E, _$StatusErrorImpl<E>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$StatusCompletedImplCopyWith<E, $Res> {
  factory _$$StatusCompletedImplCopyWith(_$StatusCompletedImpl<E> value,
          $Res Function(_$StatusCompletedImpl<E>) then) =
      __$$StatusCompletedImplCopyWithImpl<E, $Res>;
}

/// @nodoc
class __$$StatusCompletedImplCopyWithImpl<E, $Res>
    extends _$StatusCopyWithImpl<E, $Res, _$StatusCompletedImpl<E>>
    implements _$$StatusCompletedImplCopyWith<E, $Res> {
  __$$StatusCompletedImplCopyWithImpl(_$StatusCompletedImpl<E> _value,
      $Res Function(_$StatusCompletedImpl<E>) _then)
      : super(_value, _then);

  /// Create a copy of Status
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$StatusCompletedImpl<E> implements StatusCompleted<E> {
  const _$StatusCompletedImpl();

  @override
  String toString() {
    return 'Status<$E>.completed()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$StatusCompletedImpl<E>);
  }

  @override
  int get hashCode => runtimeType.hashCode;
}

abstract class StatusCompleted<E> implements Status<E> {
  const factory StatusCompleted() = _$StatusCompletedImpl<E>;
}

/// @nodoc
mixin _$StatusOf<D, E> {}

/// @nodoc
abstract class $StatusOfCopyWith<D, E, $Res> {
  factory $StatusOfCopyWith(
          StatusOf<D, E> value, $Res Function(StatusOf<D, E>) then) =
      _$StatusOfCopyWithImpl<D, E, $Res, StatusOf<D, E>>;
}

/// @nodoc
class _$StatusOfCopyWithImpl<D, E, $Res, $Val extends StatusOf<D, E>>
    implements $StatusOfCopyWith<D, E, $Res> {
  _$StatusOfCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StatusOf
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$StatusOfDataImplCopyWith<D, E, $Res> {
  factory _$$StatusOfDataImplCopyWith(_$StatusOfDataImpl<D, E> value,
          $Res Function(_$StatusOfDataImpl<D, E>) then) =
      __$$StatusOfDataImplCopyWithImpl<D, E, $Res>;
  @useResult
  $Res call({D data});
}

/// @nodoc
class __$$StatusOfDataImplCopyWithImpl<D, E, $Res>
    extends _$StatusOfCopyWithImpl<D, E, $Res, _$StatusOfDataImpl<D, E>>
    implements _$$StatusOfDataImplCopyWith<D, E, $Res> {
  __$$StatusOfDataImplCopyWithImpl(_$StatusOfDataImpl<D, E> _value,
      $Res Function(_$StatusOfDataImpl<D, E>) _then)
      : super(_value, _then);

  /// Create a copy of StatusOf
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$StatusOfDataImpl<D, E>(
      freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as D,
    ));
  }
}

/// @nodoc

class _$StatusOfDataImpl<D, E> implements StatusOfData<D, E> {
  const _$StatusOfDataImpl(this.data);

  @override
  final D data;

  @override
  String toString() {
    return 'StatusOf<$D, $E>.data(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StatusOfDataImpl<D, E> &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  /// Create a copy of StatusOf
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StatusOfDataImplCopyWith<D, E, _$StatusOfDataImpl<D, E>> get copyWith =>
      __$$StatusOfDataImplCopyWithImpl<D, E, _$StatusOfDataImpl<D, E>>(
          this, _$identity);
}

abstract class StatusOfData<D, E> implements StatusOf<D, E> {
  const factory StatusOfData(final D data) = _$StatusOfDataImpl<D, E>;

  D get data;

  /// Create a copy of StatusOf
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StatusOfDataImplCopyWith<D, E, _$StatusOfDataImpl<D, E>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$StatusOfLoadingImplCopyWith<D, E, $Res> {
  factory _$$StatusOfLoadingImplCopyWith(_$StatusOfLoadingImpl<D, E> value,
          $Res Function(_$StatusOfLoadingImpl<D, E>) then) =
      __$$StatusOfLoadingImplCopyWithImpl<D, E, $Res>;
}

/// @nodoc
class __$$StatusOfLoadingImplCopyWithImpl<D, E, $Res>
    extends _$StatusOfCopyWithImpl<D, E, $Res, _$StatusOfLoadingImpl<D, E>>
    implements _$$StatusOfLoadingImplCopyWith<D, E, $Res> {
  __$$StatusOfLoadingImplCopyWithImpl(_$StatusOfLoadingImpl<D, E> _value,
      $Res Function(_$StatusOfLoadingImpl<D, E>) _then)
      : super(_value, _then);

  /// Create a copy of StatusOf
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$StatusOfLoadingImpl<D, E> implements StatusOfLoading<D, E> {
  const _$StatusOfLoadingImpl();

  @override
  String toString() {
    return 'StatusOf<$D, $E>.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StatusOfLoadingImpl<D, E>);
  }

  @override
  int get hashCode => runtimeType.hashCode;
}

abstract class StatusOfLoading<D, E> implements StatusOf<D, E> {
  const factory StatusOfLoading() = _$StatusOfLoadingImpl<D, E>;
}

/// @nodoc
abstract class _$$StatusOfErrorImplCopyWith<D, E, $Res> {
  factory _$$StatusOfErrorImplCopyWith(_$StatusOfErrorImpl<D, E> value,
          $Res Function(_$StatusOfErrorImpl<D, E>) then) =
      __$$StatusOfErrorImplCopyWithImpl<D, E, $Res>;
  @useResult
  $Res call({E error});
}

/// @nodoc
class __$$StatusOfErrorImplCopyWithImpl<D, E, $Res>
    extends _$StatusOfCopyWithImpl<D, E, $Res, _$StatusOfErrorImpl<D, E>>
    implements _$$StatusOfErrorImplCopyWith<D, E, $Res> {
  __$$StatusOfErrorImplCopyWithImpl(_$StatusOfErrorImpl<D, E> _value,
      $Res Function(_$StatusOfErrorImpl<D, E>) _then)
      : super(_value, _then);

  /// Create a copy of StatusOf
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = freezed,
  }) {
    return _then(_$StatusOfErrorImpl<D, E>(
      freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as E,
    ));
  }
}

/// @nodoc

class _$StatusOfErrorImpl<D, E> implements StatusOfError<D, E> {
  const _$StatusOfErrorImpl(this.error);

  @override
  final E error;

  @override
  String toString() {
    return 'StatusOf<$D, $E>.error(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StatusOfErrorImpl<D, E> &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(error));

  /// Create a copy of StatusOf
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StatusOfErrorImplCopyWith<D, E, _$StatusOfErrorImpl<D, E>> get copyWith =>
      __$$StatusOfErrorImplCopyWithImpl<D, E, _$StatusOfErrorImpl<D, E>>(
          this, _$identity);
}

abstract class StatusOfError<D, E> implements StatusOf<D, E> {
  const factory StatusOfError(final E error) = _$StatusOfErrorImpl<D, E>;

  E get error;

  /// Create a copy of StatusOf
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StatusOfErrorImplCopyWith<D, E, _$StatusOfErrorImpl<D, E>> get copyWith =>
      throw _privateConstructorUsedError;
}
