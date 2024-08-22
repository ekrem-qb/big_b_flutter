// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profiles_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ProfilesEvent {}

/// @nodoc
abstract class $ProfilesEventCopyWith<$Res> {
  factory $ProfilesEventCopyWith(
          ProfilesEvent value, $Res Function(ProfilesEvent) then) =
      _$ProfilesEventCopyWithImpl<$Res, ProfilesEvent>;
}

/// @nodoc
class _$ProfilesEventCopyWithImpl<$Res, $Val extends ProfilesEvent>
    implements $ProfilesEventCopyWith<$Res> {
  _$ProfilesEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProfilesEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$ProfilesEventLoadRequestedImplCopyWith<$Res> {
  factory _$$ProfilesEventLoadRequestedImplCopyWith(
          _$ProfilesEventLoadRequestedImpl value,
          $Res Function(_$ProfilesEventLoadRequestedImpl) then) =
      __$$ProfilesEventLoadRequestedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ProfilesEventLoadRequestedImplCopyWithImpl<$Res>
    extends _$ProfilesEventCopyWithImpl<$Res, _$ProfilesEventLoadRequestedImpl>
    implements _$$ProfilesEventLoadRequestedImplCopyWith<$Res> {
  __$$ProfilesEventLoadRequestedImplCopyWithImpl(
      _$ProfilesEventLoadRequestedImpl _value,
      $Res Function(_$ProfilesEventLoadRequestedImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProfilesEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ProfilesEventLoadRequestedImpl implements ProfilesEventLoadRequested {
  const _$ProfilesEventLoadRequestedImpl();

  @override
  String toString() {
    return 'ProfilesEvent.loadRequested()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfilesEventLoadRequestedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;
}

abstract class ProfilesEventLoadRequested implements ProfilesEvent {
  const factory ProfilesEventLoadRequested() = _$ProfilesEventLoadRequestedImpl;
}

/// @nodoc
abstract class _$$ProfilesEventDataUpdatedImplCopyWith<$Res> {
  factory _$$ProfilesEventDataUpdatedImplCopyWith(
          _$ProfilesEventDataUpdatedImpl value,
          $Res Function(_$ProfilesEventDataUpdatedImpl) then) =
      __$$ProfilesEventDataUpdatedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({PostgresChangePayload payload});
}

/// @nodoc
class __$$ProfilesEventDataUpdatedImplCopyWithImpl<$Res>
    extends _$ProfilesEventCopyWithImpl<$Res, _$ProfilesEventDataUpdatedImpl>
    implements _$$ProfilesEventDataUpdatedImplCopyWith<$Res> {
  __$$ProfilesEventDataUpdatedImplCopyWithImpl(
      _$ProfilesEventDataUpdatedImpl _value,
      $Res Function(_$ProfilesEventDataUpdatedImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProfilesEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? payload = null,
  }) {
    return _then(_$ProfilesEventDataUpdatedImpl(
      payload: null == payload
          ? _value.payload
          : payload // ignore: cast_nullable_to_non_nullable
              as PostgresChangePayload,
    ));
  }
}

/// @nodoc

class _$ProfilesEventDataUpdatedImpl implements _ProfilesEventDataUpdated {
  const _$ProfilesEventDataUpdatedImpl({required this.payload});

  @override
  final PostgresChangePayload payload;

  @override
  String toString() {
    return 'ProfilesEvent.dataUpdated(payload: $payload)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfilesEventDataUpdatedImpl &&
            (identical(other.payload, payload) || other.payload == payload));
  }

  @override
  int get hashCode => Object.hash(runtimeType, payload);

  /// Create a copy of ProfilesEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProfilesEventDataUpdatedImplCopyWith<_$ProfilesEventDataUpdatedImpl>
      get copyWith => __$$ProfilesEventDataUpdatedImplCopyWithImpl<
          _$ProfilesEventDataUpdatedImpl>(this, _$identity);
}

abstract class _ProfilesEventDataUpdated implements ProfilesEvent {
  const factory _ProfilesEventDataUpdated(
          {required final PostgresChangePayload payload}) =
      _$ProfilesEventDataUpdatedImpl;

  PostgresChangePayload get payload;

  /// Create a copy of ProfilesEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProfilesEventDataUpdatedImplCopyWith<_$ProfilesEventDataUpdatedImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ProfilesState {}

/// @nodoc
abstract class $ProfilesStateCopyWith<$Res> {
  factory $ProfilesStateCopyWith(
          ProfilesState value, $Res Function(ProfilesState) then) =
      _$ProfilesStateCopyWithImpl<$Res, ProfilesState>;
}

/// @nodoc
class _$ProfilesStateCopyWithImpl<$Res, $Val extends ProfilesState>
    implements $ProfilesStateCopyWith<$Res> {
  _$ProfilesStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProfilesState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$ProfilesStateDataImplCopyWith<$Res> {
  factory _$$ProfilesStateDataImplCopyWith(_$ProfilesStateDataImpl value,
          $Res Function(_$ProfilesStateDataImpl) then) =
      __$$ProfilesStateDataImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Profile> profiles});
}

/// @nodoc
class __$$ProfilesStateDataImplCopyWithImpl<$Res>
    extends _$ProfilesStateCopyWithImpl<$Res, _$ProfilesStateDataImpl>
    implements _$$ProfilesStateDataImplCopyWith<$Res> {
  __$$ProfilesStateDataImplCopyWithImpl(_$ProfilesStateDataImpl _value,
      $Res Function(_$ProfilesStateDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProfilesState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? profiles = null,
  }) {
    return _then(_$ProfilesStateDataImpl(
      profiles: null == profiles
          ? _value._profiles
          : profiles // ignore: cast_nullable_to_non_nullable
              as List<Profile>,
    ));
  }
}

/// @nodoc

class _$ProfilesStateDataImpl implements ProfilesStateData {
  const _$ProfilesStateDataImpl({required final List<Profile> profiles})
      : _profiles = profiles;

  final List<Profile> _profiles;
  @override
  List<Profile> get profiles {
    if (_profiles is EqualUnmodifiableListView) return _profiles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_profiles);
  }

  @override
  String toString() {
    return 'ProfilesState.data(profiles: $profiles)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfilesStateDataImpl &&
            const DeepCollectionEquality().equals(other._profiles, _profiles));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_profiles));

  /// Create a copy of ProfilesState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProfilesStateDataImplCopyWith<_$ProfilesStateDataImpl> get copyWith =>
      __$$ProfilesStateDataImplCopyWithImpl<_$ProfilesStateDataImpl>(
          this, _$identity);
}

abstract class ProfilesStateData implements ProfilesState {
  const factory ProfilesStateData({required final List<Profile> profiles}) =
      _$ProfilesStateDataImpl;

  List<Profile> get profiles;

  /// Create a copy of ProfilesState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProfilesStateDataImplCopyWith<_$ProfilesStateDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ProfilesStateLoadingImplCopyWith<$Res> {
  factory _$$ProfilesStateLoadingImplCopyWith(_$ProfilesStateLoadingImpl value,
          $Res Function(_$ProfilesStateLoadingImpl) then) =
      __$$ProfilesStateLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ProfilesStateLoadingImplCopyWithImpl<$Res>
    extends _$ProfilesStateCopyWithImpl<$Res, _$ProfilesStateLoadingImpl>
    implements _$$ProfilesStateLoadingImplCopyWith<$Res> {
  __$$ProfilesStateLoadingImplCopyWithImpl(_$ProfilesStateLoadingImpl _value,
      $Res Function(_$ProfilesStateLoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProfilesState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ProfilesStateLoadingImpl implements ProfilesStateLoading {
  const _$ProfilesStateLoadingImpl();

  @override
  String toString() {
    return 'ProfilesState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfilesStateLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;
}

abstract class ProfilesStateLoading implements ProfilesState {
  const factory ProfilesStateLoading() = _$ProfilesStateLoadingImpl;
}

/// @nodoc
abstract class _$$ProfilesStateErrorImplCopyWith<$Res> {
  factory _$$ProfilesStateErrorImplCopyWith(_$ProfilesStateErrorImpl value,
          $Res Function(_$ProfilesStateErrorImpl) then) =
      __$$ProfilesStateErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$ProfilesStateErrorImplCopyWithImpl<$Res>
    extends _$ProfilesStateCopyWithImpl<$Res, _$ProfilesStateErrorImpl>
    implements _$$ProfilesStateErrorImplCopyWith<$Res> {
  __$$ProfilesStateErrorImplCopyWithImpl(_$ProfilesStateErrorImpl _value,
      $Res Function(_$ProfilesStateErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProfilesState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$ProfilesStateErrorImpl(
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ProfilesStateErrorImpl implements ProfilesStateError {
  const _$ProfilesStateErrorImpl({required this.error});

  @override
  final String error;

  @override
  String toString() {
    return 'ProfilesState.error(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfilesStateErrorImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  /// Create a copy of ProfilesState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProfilesStateErrorImplCopyWith<_$ProfilesStateErrorImpl> get copyWith =>
      __$$ProfilesStateErrorImplCopyWithImpl<_$ProfilesStateErrorImpl>(
          this, _$identity);
}

abstract class ProfilesStateError implements ProfilesState {
  const factory ProfilesStateError({required final String error}) =
      _$ProfilesStateErrorImpl;

  String get error;

  /// Create a copy of ProfilesState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProfilesStateErrorImplCopyWith<_$ProfilesStateErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
