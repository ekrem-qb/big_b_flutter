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
mixin _$OperationStatus {}

/// @nodoc
abstract class $OperationStatusCopyWith<$Res> {
  factory $OperationStatusCopyWith(
          OperationStatus value, $Res Function(OperationStatus) then) =
      _$OperationStatusCopyWithImpl<$Res, OperationStatus>;
}

/// @nodoc
class _$OperationStatusCopyWithImpl<$Res, $Val extends OperationStatus>
    implements $OperationStatusCopyWith<$Res> {
  _$OperationStatusCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OperationStatus
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$OperationStatusInitialImplCopyWith<$Res> {
  factory _$$OperationStatusInitialImplCopyWith(
          _$OperationStatusInitialImpl value,
          $Res Function(_$OperationStatusInitialImpl) then) =
      __$$OperationStatusInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$OperationStatusInitialImplCopyWithImpl<$Res>
    extends _$OperationStatusCopyWithImpl<$Res, _$OperationStatusInitialImpl>
    implements _$$OperationStatusInitialImplCopyWith<$Res> {
  __$$OperationStatusInitialImplCopyWithImpl(
      _$OperationStatusInitialImpl _value,
      $Res Function(_$OperationStatusInitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of OperationStatus
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$OperationStatusInitialImpl implements OperationStatusInitial {
  const _$OperationStatusInitialImpl();

  @override
  String toString() {
    return 'OperationStatus.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OperationStatusInitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;
}

abstract class OperationStatusInitial implements OperationStatus {
  const factory OperationStatusInitial() = _$OperationStatusInitialImpl;
}

/// @nodoc
abstract class _$$OperationStatusInProgressImplCopyWith<$Res> {
  factory _$$OperationStatusInProgressImplCopyWith(
          _$OperationStatusInProgressImpl value,
          $Res Function(_$OperationStatusInProgressImpl) then) =
      __$$OperationStatusInProgressImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$OperationStatusInProgressImplCopyWithImpl<$Res>
    extends _$OperationStatusCopyWithImpl<$Res, _$OperationStatusInProgressImpl>
    implements _$$OperationStatusInProgressImplCopyWith<$Res> {
  __$$OperationStatusInProgressImplCopyWithImpl(
      _$OperationStatusInProgressImpl _value,
      $Res Function(_$OperationStatusInProgressImpl) _then)
      : super(_value, _then);

  /// Create a copy of OperationStatus
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$OperationStatusInProgressImpl implements OperationStatusInProgress {
  const _$OperationStatusInProgressImpl();

  @override
  String toString() {
    return 'OperationStatus.inProgress()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OperationStatusInProgressImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;
}

abstract class OperationStatusInProgress implements OperationStatus {
  const factory OperationStatusInProgress() = _$OperationStatusInProgressImpl;
}

/// @nodoc
abstract class _$$OperationStatusErrorImplCopyWith<$Res> {
  factory _$$OperationStatusErrorImplCopyWith(_$OperationStatusErrorImpl value,
          $Res Function(_$OperationStatusErrorImpl) then) =
      __$$OperationStatusErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$OperationStatusErrorImplCopyWithImpl<$Res>
    extends _$OperationStatusCopyWithImpl<$Res, _$OperationStatusErrorImpl>
    implements _$$OperationStatusErrorImplCopyWith<$Res> {
  __$$OperationStatusErrorImplCopyWithImpl(_$OperationStatusErrorImpl _value,
      $Res Function(_$OperationStatusErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of OperationStatus
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$OperationStatusErrorImpl(
      null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$OperationStatusErrorImpl implements OperationStatusError {
  const _$OperationStatusErrorImpl(this.error);

  @override
  final String error;

  @override
  String toString() {
    return 'OperationStatus.error(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OperationStatusErrorImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  /// Create a copy of OperationStatus
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OperationStatusErrorImplCopyWith<_$OperationStatusErrorImpl>
      get copyWith =>
          __$$OperationStatusErrorImplCopyWithImpl<_$OperationStatusErrorImpl>(
              this, _$identity);
}

abstract class OperationStatusError implements OperationStatus {
  const factory OperationStatusError(final String error) =
      _$OperationStatusErrorImpl;

  String get error;

  /// Create a copy of OperationStatus
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OperationStatusErrorImplCopyWith<_$OperationStatusErrorImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$OperationStatusCompletedImplCopyWith<$Res> {
  factory _$$OperationStatusCompletedImplCopyWith(
          _$OperationStatusCompletedImpl value,
          $Res Function(_$OperationStatusCompletedImpl) then) =
      __$$OperationStatusCompletedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$OperationStatusCompletedImplCopyWithImpl<$Res>
    extends _$OperationStatusCopyWithImpl<$Res, _$OperationStatusCompletedImpl>
    implements _$$OperationStatusCompletedImplCopyWith<$Res> {
  __$$OperationStatusCompletedImplCopyWithImpl(
      _$OperationStatusCompletedImpl _value,
      $Res Function(_$OperationStatusCompletedImpl) _then)
      : super(_value, _then);

  /// Create a copy of OperationStatus
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$OperationStatusCompletedImpl implements OperationStatusCompleted {
  const _$OperationStatusCompletedImpl();

  @override
  String toString() {
    return 'OperationStatus.completed()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OperationStatusCompletedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;
}

abstract class OperationStatusCompleted implements OperationStatus {
  const factory OperationStatusCompleted() = _$OperationStatusCompletedImpl;
}

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
abstract class _$$StatusLoadingImplCopyWith<$Res> {
  factory _$$StatusLoadingImplCopyWith(
          _$StatusLoadingImpl value, $Res Function(_$StatusLoadingImpl) then) =
      __$$StatusLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$StatusLoadingImplCopyWithImpl<$Res>
    extends _$StatusCopyWithImpl<$Res, _$StatusLoadingImpl>
    implements _$$StatusLoadingImplCopyWith<$Res> {
  __$$StatusLoadingImplCopyWithImpl(
      _$StatusLoadingImpl _value, $Res Function(_$StatusLoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of Status
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$StatusLoadingImpl implements StatusLoading {
  const _$StatusLoadingImpl();

  @override
  String toString() {
    return 'Status.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$StatusLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;
}

abstract class StatusLoading implements Status {
  const factory StatusLoading() = _$StatusLoadingImpl;
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
      null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$StatusErrorImpl implements StatusError {
  const _$StatusErrorImpl(this.error);

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
  const factory StatusError(final String error) = _$StatusErrorImpl;

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

/// @nodoc
mixin _$StatusOf<T> {}

/// @nodoc
abstract class $StatusOfCopyWith<T, $Res> {
  factory $StatusOfCopyWith(
          StatusOf<T> value, $Res Function(StatusOf<T>) then) =
      _$StatusOfCopyWithImpl<T, $Res, StatusOf<T>>;
}

/// @nodoc
class _$StatusOfCopyWithImpl<T, $Res, $Val extends StatusOf<T>>
    implements $StatusOfCopyWith<T, $Res> {
  _$StatusOfCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StatusOf
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$StatusOfDataImplCopyWith<T, $Res> {
  factory _$$StatusOfDataImplCopyWith(_$StatusOfDataImpl<T> value,
          $Res Function(_$StatusOfDataImpl<T>) then) =
      __$$StatusOfDataImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({T data});
}

/// @nodoc
class __$$StatusOfDataImplCopyWithImpl<T, $Res>
    extends _$StatusOfCopyWithImpl<T, $Res, _$StatusOfDataImpl<T>>
    implements _$$StatusOfDataImplCopyWith<T, $Res> {
  __$$StatusOfDataImplCopyWithImpl(
      _$StatusOfDataImpl<T> _value, $Res Function(_$StatusOfDataImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of StatusOf
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$StatusOfDataImpl<T>(
      freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$StatusOfDataImpl<T> implements StatusOfData<T> {
  const _$StatusOfDataImpl(this.data);

  @override
  final T data;

  @override
  String toString() {
    return 'StatusOf<$T>.data(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StatusOfDataImpl<T> &&
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
  _$$StatusOfDataImplCopyWith<T, _$StatusOfDataImpl<T>> get copyWith =>
      __$$StatusOfDataImplCopyWithImpl<T, _$StatusOfDataImpl<T>>(
          this, _$identity);
}

abstract class StatusOfData<T> implements StatusOf<T> {
  const factory StatusOfData(final T data) = _$StatusOfDataImpl<T>;

  T get data;

  /// Create a copy of StatusOf
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StatusOfDataImplCopyWith<T, _$StatusOfDataImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$StatusOfLoadingImplCopyWith<T, $Res> {
  factory _$$StatusOfLoadingImplCopyWith(_$StatusOfLoadingImpl<T> value,
          $Res Function(_$StatusOfLoadingImpl<T>) then) =
      __$$StatusOfLoadingImplCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$StatusOfLoadingImplCopyWithImpl<T, $Res>
    extends _$StatusOfCopyWithImpl<T, $Res, _$StatusOfLoadingImpl<T>>
    implements _$$StatusOfLoadingImplCopyWith<T, $Res> {
  __$$StatusOfLoadingImplCopyWithImpl(_$StatusOfLoadingImpl<T> _value,
      $Res Function(_$StatusOfLoadingImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of StatusOf
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$StatusOfLoadingImpl<T> implements StatusOfLoading<T> {
  const _$StatusOfLoadingImpl();

  @override
  String toString() {
    return 'StatusOf<$T>.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$StatusOfLoadingImpl<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;
}

abstract class StatusOfLoading<T> implements StatusOf<T> {
  const factory StatusOfLoading() = _$StatusOfLoadingImpl<T>;
}

/// @nodoc
abstract class _$$StatusOfErrorImplCopyWith<T, $Res> {
  factory _$$StatusOfErrorImplCopyWith(_$StatusOfErrorImpl<T> value,
          $Res Function(_$StatusOfErrorImpl<T>) then) =
      __$$StatusOfErrorImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$StatusOfErrorImplCopyWithImpl<T, $Res>
    extends _$StatusOfCopyWithImpl<T, $Res, _$StatusOfErrorImpl<T>>
    implements _$$StatusOfErrorImplCopyWith<T, $Res> {
  __$$StatusOfErrorImplCopyWithImpl(_$StatusOfErrorImpl<T> _value,
      $Res Function(_$StatusOfErrorImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of StatusOf
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$StatusOfErrorImpl<T>(
      null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$StatusOfErrorImpl<T> implements StatusOfError<T> {
  const _$StatusOfErrorImpl(this.error);

  @override
  final String error;

  @override
  String toString() {
    return 'StatusOf<$T>.error(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StatusOfErrorImpl<T> &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  /// Create a copy of StatusOf
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StatusOfErrorImplCopyWith<T, _$StatusOfErrorImpl<T>> get copyWith =>
      __$$StatusOfErrorImplCopyWithImpl<T, _$StatusOfErrorImpl<T>>(
          this, _$identity);
}

abstract class StatusOfError<T> implements StatusOf<T> {
  const factory StatusOfError(final String error) = _$StatusOfErrorImpl<T>;

  String get error;

  /// Create a copy of StatusOf
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StatusOfErrorImplCopyWith<T, _$StatusOfErrorImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
