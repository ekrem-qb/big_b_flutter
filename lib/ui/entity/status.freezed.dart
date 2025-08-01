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
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$OperationStatus {}

/// @nodoc
abstract class $OperationStatusCopyWith<$Res> {
  factory $OperationStatusCopyWith(
    OperationStatus value,
    $Res Function(OperationStatus) then,
  ) = _$OperationStatusCopyWithImpl<$Res, OperationStatus>;
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
    $Res Function(_$OperationStatusInitialImpl) then,
  ) = __$$OperationStatusInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$OperationStatusInitialImplCopyWithImpl<$Res>
    extends _$OperationStatusCopyWithImpl<$Res, _$OperationStatusInitialImpl>
    implements _$$OperationStatusInitialImplCopyWith<$Res> {
  __$$OperationStatusInitialImplCopyWithImpl(
    _$OperationStatusInitialImpl _value,
    $Res Function(_$OperationStatusInitialImpl) _then,
  ) : super(_value, _then);

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
    $Res Function(_$OperationStatusInProgressImpl) then,
  ) = __$$OperationStatusInProgressImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$OperationStatusInProgressImplCopyWithImpl<$Res>
    extends _$OperationStatusCopyWithImpl<$Res, _$OperationStatusInProgressImpl>
    implements _$$OperationStatusInProgressImplCopyWith<$Res> {
  __$$OperationStatusInProgressImplCopyWithImpl(
    _$OperationStatusInProgressImpl _value,
    $Res Function(_$OperationStatusInProgressImpl) _then,
  ) : super(_value, _then);

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
  factory _$$OperationStatusErrorImplCopyWith(
    _$OperationStatusErrorImpl value,
    $Res Function(_$OperationStatusErrorImpl) then,
  ) = __$$OperationStatusErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Object error});
}

/// @nodoc
class __$$OperationStatusErrorImplCopyWithImpl<$Res>
    extends _$OperationStatusCopyWithImpl<$Res, _$OperationStatusErrorImpl>
    implements _$$OperationStatusErrorImplCopyWith<$Res> {
  __$$OperationStatusErrorImplCopyWithImpl(
    _$OperationStatusErrorImpl _value,
    $Res Function(_$OperationStatusErrorImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of OperationStatus
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? error = null}) {
    return _then(
      _$OperationStatusErrorImpl(null == error ? _value.error : error),
    );
  }
}

/// @nodoc

class _$OperationStatusErrorImpl implements OperationStatusError {
  const _$OperationStatusErrorImpl(this.error);

  @override
  final Object error;

  @override
  String toString() {
    return 'OperationStatus.error(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OperationStatusErrorImpl &&
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
  _$$OperationStatusErrorImplCopyWith<_$OperationStatusErrorImpl>
  get copyWith =>
      __$$OperationStatusErrorImplCopyWithImpl<_$OperationStatusErrorImpl>(
        this,
        _$identity,
      );
}

abstract class OperationStatusError implements OperationStatus {
  const factory OperationStatusError(final Object error) =
      _$OperationStatusErrorImpl;

  Object get error;

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
    $Res Function(_$OperationStatusCompletedImpl) then,
  ) = __$$OperationStatusCompletedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$OperationStatusCompletedImplCopyWithImpl<$Res>
    extends _$OperationStatusCopyWithImpl<$Res, _$OperationStatusCompletedImpl>
    implements _$$OperationStatusCompletedImplCopyWith<$Res> {
  __$$OperationStatusCompletedImplCopyWithImpl(
    _$OperationStatusCompletedImpl _value,
    $Res Function(_$OperationStatusCompletedImpl) _then,
  ) : super(_value, _then);

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
    _$StatusLoadingImpl value,
    $Res Function(_$StatusLoadingImpl) then,
  ) = __$$StatusLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$StatusLoadingImplCopyWithImpl<$Res>
    extends _$StatusCopyWithImpl<$Res, _$StatusLoadingImpl>
    implements _$$StatusLoadingImplCopyWith<$Res> {
  __$$StatusLoadingImplCopyWithImpl(
    _$StatusLoadingImpl _value,
    $Res Function(_$StatusLoadingImpl) _then,
  ) : super(_value, _then);

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
    _$StatusErrorImpl value,
    $Res Function(_$StatusErrorImpl) then,
  ) = __$$StatusErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Object error});
}

/// @nodoc
class __$$StatusErrorImplCopyWithImpl<$Res>
    extends _$StatusCopyWithImpl<$Res, _$StatusErrorImpl>
    implements _$$StatusErrorImplCopyWith<$Res> {
  __$$StatusErrorImplCopyWithImpl(
    _$StatusErrorImpl _value,
    $Res Function(_$StatusErrorImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Status
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? error = null}) {
    return _then(_$StatusErrorImpl(null == error ? _value.error : error));
  }
}

/// @nodoc

class _$StatusErrorImpl implements StatusError {
  const _$StatusErrorImpl(this.error);

  @override
  final Object error;

  @override
  String toString() {
    return 'Status.error(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StatusErrorImpl &&
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
  _$$StatusErrorImplCopyWith<_$StatusErrorImpl> get copyWith =>
      __$$StatusErrorImplCopyWithImpl<_$StatusErrorImpl>(this, _$identity);
}

abstract class StatusError implements Status {
  const factory StatusError(final Object error) = _$StatusErrorImpl;

  Object get error;

  /// Create a copy of Status
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StatusErrorImplCopyWith<_$StatusErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$StatusCompletedImplCopyWith<$Res> {
  factory _$$StatusCompletedImplCopyWith(
    _$StatusCompletedImpl value,
    $Res Function(_$StatusCompletedImpl) then,
  ) = __$$StatusCompletedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$StatusCompletedImplCopyWithImpl<$Res>
    extends _$StatusCopyWithImpl<$Res, _$StatusCompletedImpl>
    implements _$$StatusCompletedImplCopyWith<$Res> {
  __$$StatusCompletedImplCopyWithImpl(
    _$StatusCompletedImpl _value,
    $Res Function(_$StatusCompletedImpl) _then,
  ) : super(_value, _then);

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
mixin _$StatusOf<D> {}

/// @nodoc
abstract class $StatusOfCopyWith<D, $Res> {
  factory $StatusOfCopyWith(
    StatusOf<D> value,
    $Res Function(StatusOf<D>) then,
  ) = _$StatusOfCopyWithImpl<D, $Res, StatusOf<D>>;
}

/// @nodoc
class _$StatusOfCopyWithImpl<D, $Res, $Val extends StatusOf<D>>
    implements $StatusOfCopyWith<D, $Res> {
  _$StatusOfCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StatusOf
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$StatusOfDataImplCopyWith<D, $Res> {
  factory _$$StatusOfDataImplCopyWith(
    _$StatusOfDataImpl<D> value,
    $Res Function(_$StatusOfDataImpl<D>) then,
  ) = __$$StatusOfDataImplCopyWithImpl<D, $Res>;
  @useResult
  $Res call({D data});
}

/// @nodoc
class __$$StatusOfDataImplCopyWithImpl<D, $Res>
    extends _$StatusOfCopyWithImpl<D, $Res, _$StatusOfDataImpl<D>>
    implements _$$StatusOfDataImplCopyWith<D, $Res> {
  __$$StatusOfDataImplCopyWithImpl(
    _$StatusOfDataImpl<D> _value,
    $Res Function(_$StatusOfDataImpl<D>) _then,
  ) : super(_value, _then);

  /// Create a copy of StatusOf
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? data = freezed}) {
    return _then(
      _$StatusOfDataImpl<D>(
        freezed == data
            ? _value.data
            : data // ignore: cast_nullable_to_non_nullable
                as D,
      ),
    );
  }
}

/// @nodoc

class _$StatusOfDataImpl<D> implements StatusOfData<D> {
  const _$StatusOfDataImpl(this.data);

  @override
  final D data;

  @override
  String toString() {
    return 'StatusOf<$D>.data(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StatusOfDataImpl<D> &&
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
  _$$StatusOfDataImplCopyWith<D, _$StatusOfDataImpl<D>> get copyWith =>
      __$$StatusOfDataImplCopyWithImpl<D, _$StatusOfDataImpl<D>>(
        this,
        _$identity,
      );
}

abstract class StatusOfData<D> implements StatusOf<D> {
  const factory StatusOfData(final D data) = _$StatusOfDataImpl<D>;

  D get data;

  /// Create a copy of StatusOf
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StatusOfDataImplCopyWith<D, _$StatusOfDataImpl<D>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$StatusOfLoadingImplCopyWith<D, $Res> {
  factory _$$StatusOfLoadingImplCopyWith(
    _$StatusOfLoadingImpl<D> value,
    $Res Function(_$StatusOfLoadingImpl<D>) then,
  ) = __$$StatusOfLoadingImplCopyWithImpl<D, $Res>;
}

/// @nodoc
class __$$StatusOfLoadingImplCopyWithImpl<D, $Res>
    extends _$StatusOfCopyWithImpl<D, $Res, _$StatusOfLoadingImpl<D>>
    implements _$$StatusOfLoadingImplCopyWith<D, $Res> {
  __$$StatusOfLoadingImplCopyWithImpl(
    _$StatusOfLoadingImpl<D> _value,
    $Res Function(_$StatusOfLoadingImpl<D>) _then,
  ) : super(_value, _then);

  /// Create a copy of StatusOf
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$StatusOfLoadingImpl<D> implements StatusOfLoading<D> {
  const _$StatusOfLoadingImpl();

  @override
  String toString() {
    return 'StatusOf<$D>.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$StatusOfLoadingImpl<D>);
  }

  @override
  int get hashCode => runtimeType.hashCode;
}

abstract class StatusOfLoading<D> implements StatusOf<D> {
  const factory StatusOfLoading() = _$StatusOfLoadingImpl<D>;
}

/// @nodoc
abstract class _$$StatusOfErrorImplCopyWith<D, $Res> {
  factory _$$StatusOfErrorImplCopyWith(
    _$StatusOfErrorImpl<D> value,
    $Res Function(_$StatusOfErrorImpl<D>) then,
  ) = __$$StatusOfErrorImplCopyWithImpl<D, $Res>;
  @useResult
  $Res call({Object error});
}

/// @nodoc
class __$$StatusOfErrorImplCopyWithImpl<D, $Res>
    extends _$StatusOfCopyWithImpl<D, $Res, _$StatusOfErrorImpl<D>>
    implements _$$StatusOfErrorImplCopyWith<D, $Res> {
  __$$StatusOfErrorImplCopyWithImpl(
    _$StatusOfErrorImpl<D> _value,
    $Res Function(_$StatusOfErrorImpl<D>) _then,
  ) : super(_value, _then);

  /// Create a copy of StatusOf
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? error = null}) {
    return _then(_$StatusOfErrorImpl<D>(null == error ? _value.error : error));
  }
}

/// @nodoc

class _$StatusOfErrorImpl<D> implements StatusOfError<D> {
  const _$StatusOfErrorImpl(this.error);

  @override
  final Object error;

  @override
  String toString() {
    return 'StatusOf<$D>.error(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StatusOfErrorImpl<D> &&
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
  _$$StatusOfErrorImplCopyWith<D, _$StatusOfErrorImpl<D>> get copyWith =>
      __$$StatusOfErrorImplCopyWithImpl<D, _$StatusOfErrorImpl<D>>(
        this,
        _$identity,
      );
}

abstract class StatusOfError<D> implements StatusOf<D> {
  const factory StatusOfError(final Object error) = _$StatusOfErrorImpl<D>;

  Object get error;

  /// Create a copy of StatusOf
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StatusOfErrorImplCopyWith<D, _$StatusOfErrorImpl<D>> get copyWith =>
      throw _privateConstructorUsedError;
}
