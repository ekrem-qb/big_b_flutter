// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recordings_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$RecordingsEvent {}

/// @nodoc
abstract class $RecordingsEventCopyWith<$Res> {
  factory $RecordingsEventCopyWith(
          RecordingsEvent value, $Res Function(RecordingsEvent) then) =
      _$RecordingsEventCopyWithImpl<$Res, RecordingsEvent>;
}

/// @nodoc
class _$RecordingsEventCopyWithImpl<$Res, $Val extends RecordingsEvent>
    implements $RecordingsEventCopyWith<$Res> {
  _$RecordingsEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RecordingsEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$RecordingsEventLoadRequestedImplCopyWith<$Res> {
  factory _$$RecordingsEventLoadRequestedImplCopyWith(
          _$RecordingsEventLoadRequestedImpl value,
          $Res Function(_$RecordingsEventLoadRequestedImpl) then) =
      __$$RecordingsEventLoadRequestedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RecordingsEventLoadRequestedImplCopyWithImpl<$Res>
    extends _$RecordingsEventCopyWithImpl<$Res,
        _$RecordingsEventLoadRequestedImpl>
    implements _$$RecordingsEventLoadRequestedImplCopyWith<$Res> {
  __$$RecordingsEventLoadRequestedImplCopyWithImpl(
      _$RecordingsEventLoadRequestedImpl _value,
      $Res Function(_$RecordingsEventLoadRequestedImpl) _then)
      : super(_value, _then);

  /// Create a copy of RecordingsEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$RecordingsEventLoadRequestedImpl
    implements RecordingsEventLoadRequested {
  const _$RecordingsEventLoadRequestedImpl();

  @override
  String toString() {
    return 'RecordingsEvent.loadRequested()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecordingsEventLoadRequestedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;
}

abstract class RecordingsEventLoadRequested implements RecordingsEvent {
  const factory RecordingsEventLoadRequested() =
      _$RecordingsEventLoadRequestedImpl;
}

/// @nodoc
abstract class _$$RecordingsEventDataUpdatedImplCopyWith<$Res> {
  factory _$$RecordingsEventDataUpdatedImplCopyWith(
          _$RecordingsEventDataUpdatedImpl value,
          $Res Function(_$RecordingsEventDataUpdatedImpl) then) =
      __$$RecordingsEventDataUpdatedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({PostgresChangePayload payload});
}

/// @nodoc
class __$$RecordingsEventDataUpdatedImplCopyWithImpl<$Res>
    extends _$RecordingsEventCopyWithImpl<$Res,
        _$RecordingsEventDataUpdatedImpl>
    implements _$$RecordingsEventDataUpdatedImplCopyWith<$Res> {
  __$$RecordingsEventDataUpdatedImplCopyWithImpl(
      _$RecordingsEventDataUpdatedImpl _value,
      $Res Function(_$RecordingsEventDataUpdatedImpl) _then)
      : super(_value, _then);

  /// Create a copy of RecordingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? payload = null,
  }) {
    return _then(_$RecordingsEventDataUpdatedImpl(
      payload: null == payload
          ? _value.payload
          : payload // ignore: cast_nullable_to_non_nullable
              as PostgresChangePayload,
    ));
  }
}

/// @nodoc

class _$RecordingsEventDataUpdatedImpl implements _RecordingsEventDataUpdated {
  const _$RecordingsEventDataUpdatedImpl({required this.payload});

  @override
  final PostgresChangePayload payload;

  @override
  String toString() {
    return 'RecordingsEvent.dataUpdated(payload: $payload)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecordingsEventDataUpdatedImpl &&
            (identical(other.payload, payload) || other.payload == payload));
  }

  @override
  int get hashCode => Object.hash(runtimeType, payload);

  /// Create a copy of RecordingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RecordingsEventDataUpdatedImplCopyWith<_$RecordingsEventDataUpdatedImpl>
      get copyWith => __$$RecordingsEventDataUpdatedImplCopyWithImpl<
          _$RecordingsEventDataUpdatedImpl>(this, _$identity);
}

abstract class _RecordingsEventDataUpdated implements RecordingsEvent {
  const factory _RecordingsEventDataUpdated(
          {required final PostgresChangePayload payload}) =
      _$RecordingsEventDataUpdatedImpl;

  PostgresChangePayload get payload;

  /// Create a copy of RecordingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RecordingsEventDataUpdatedImplCopyWith<_$RecordingsEventDataUpdatedImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$RecordingsState {}

/// @nodoc
abstract class $RecordingsStateCopyWith<$Res> {
  factory $RecordingsStateCopyWith(
          RecordingsState value, $Res Function(RecordingsState) then) =
      _$RecordingsStateCopyWithImpl<$Res, RecordingsState>;
}

/// @nodoc
class _$RecordingsStateCopyWithImpl<$Res, $Val extends RecordingsState>
    implements $RecordingsStateCopyWith<$Res> {
  _$RecordingsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RecordingsState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$RecordingsStateDataImplCopyWith<$Res> {
  factory _$$RecordingsStateDataImplCopyWith(_$RecordingsStateDataImpl value,
          $Res Function(_$RecordingsStateDataImpl) then) =
      __$$RecordingsStateDataImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Recording> recordings});
}

/// @nodoc
class __$$RecordingsStateDataImplCopyWithImpl<$Res>
    extends _$RecordingsStateCopyWithImpl<$Res, _$RecordingsStateDataImpl>
    implements _$$RecordingsStateDataImplCopyWith<$Res> {
  __$$RecordingsStateDataImplCopyWithImpl(_$RecordingsStateDataImpl _value,
      $Res Function(_$RecordingsStateDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of RecordingsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? recordings = null,
  }) {
    return _then(_$RecordingsStateDataImpl(
      recordings: null == recordings
          ? _value._recordings
          : recordings // ignore: cast_nullable_to_non_nullable
              as List<Recording>,
    ));
  }
}

/// @nodoc

class _$RecordingsStateDataImpl implements RecordingsStateData {
  const _$RecordingsStateDataImpl({required final List<Recording> recordings})
      : _recordings = recordings;

  final List<Recording> _recordings;
  @override
  List<Recording> get recordings {
    if (_recordings is EqualUnmodifiableListView) return _recordings;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_recordings);
  }

  @override
  String toString() {
    return 'RecordingsState.data(recordings: $recordings)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecordingsStateDataImpl &&
            const DeepCollectionEquality()
                .equals(other._recordings, _recordings));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_recordings));

  /// Create a copy of RecordingsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RecordingsStateDataImplCopyWith<_$RecordingsStateDataImpl> get copyWith =>
      __$$RecordingsStateDataImplCopyWithImpl<_$RecordingsStateDataImpl>(
          this, _$identity);
}

abstract class RecordingsStateData implements RecordingsState {
  const factory RecordingsStateData(
      {required final List<Recording> recordings}) = _$RecordingsStateDataImpl;

  List<Recording> get recordings;

  /// Create a copy of RecordingsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RecordingsStateDataImplCopyWith<_$RecordingsStateDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RecordingsStateLoadingImplCopyWith<$Res> {
  factory _$$RecordingsStateLoadingImplCopyWith(
          _$RecordingsStateLoadingImpl value,
          $Res Function(_$RecordingsStateLoadingImpl) then) =
      __$$RecordingsStateLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RecordingsStateLoadingImplCopyWithImpl<$Res>
    extends _$RecordingsStateCopyWithImpl<$Res, _$RecordingsStateLoadingImpl>
    implements _$$RecordingsStateLoadingImplCopyWith<$Res> {
  __$$RecordingsStateLoadingImplCopyWithImpl(
      _$RecordingsStateLoadingImpl _value,
      $Res Function(_$RecordingsStateLoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of RecordingsState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$RecordingsStateLoadingImpl implements RecordingsStateLoading {
  const _$RecordingsStateLoadingImpl();

  @override
  String toString() {
    return 'RecordingsState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecordingsStateLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;
}

abstract class RecordingsStateLoading implements RecordingsState {
  const factory RecordingsStateLoading() = _$RecordingsStateLoadingImpl;
}

/// @nodoc
abstract class _$$RecordingsStateErrorImplCopyWith<$Res> {
  factory _$$RecordingsStateErrorImplCopyWith(_$RecordingsStateErrorImpl value,
          $Res Function(_$RecordingsStateErrorImpl) then) =
      __$$RecordingsStateErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$RecordingsStateErrorImplCopyWithImpl<$Res>
    extends _$RecordingsStateCopyWithImpl<$Res, _$RecordingsStateErrorImpl>
    implements _$$RecordingsStateErrorImplCopyWith<$Res> {
  __$$RecordingsStateErrorImplCopyWithImpl(_$RecordingsStateErrorImpl _value,
      $Res Function(_$RecordingsStateErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of RecordingsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$RecordingsStateErrorImpl(
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$RecordingsStateErrorImpl implements RecordingsStateError {
  const _$RecordingsStateErrorImpl({required this.error});

  @override
  final String error;

  @override
  String toString() {
    return 'RecordingsState.error(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecordingsStateErrorImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  /// Create a copy of RecordingsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RecordingsStateErrorImplCopyWith<_$RecordingsStateErrorImpl>
      get copyWith =>
          __$$RecordingsStateErrorImplCopyWithImpl<_$RecordingsStateErrorImpl>(
              this, _$identity);
}

abstract class RecordingsStateError implements RecordingsState {
  const factory RecordingsStateError({required final String error}) =
      _$RecordingsStateErrorImpl;

  String get error;

  /// Create a copy of RecordingsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RecordingsStateErrorImplCopyWith<_$RecordingsStateErrorImpl>
      get copyWith => throw _privateConstructorUsedError;
}
