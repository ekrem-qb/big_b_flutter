// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AppEvent {}

/// @nodoc
abstract class $AppEventCopyWith<$Res> {
  factory $AppEventCopyWith(AppEvent value, $Res Function(AppEvent) then) =
      _$AppEventCopyWithImpl<$Res, AppEvent>;
}

/// @nodoc
class _$AppEventCopyWithImpl<$Res, $Val extends AppEvent>
    implements $AppEventCopyWith<$Res> {
  _$AppEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AppEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$AppEventSignedInImplCopyWith<$Res> {
  factory _$$AppEventSignedInImplCopyWith(_$AppEventSignedInImpl value,
          $Res Function(_$AppEventSignedInImpl) then) =
      __$$AppEventSignedInImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AppEventSignedInImplCopyWithImpl<$Res>
    extends _$AppEventCopyWithImpl<$Res, _$AppEventSignedInImpl>
    implements _$$AppEventSignedInImplCopyWith<$Res> {
  __$$AppEventSignedInImplCopyWithImpl(_$AppEventSignedInImpl _value,
      $Res Function(_$AppEventSignedInImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$AppEventSignedInImpl implements AppEventSignedIn {
  const _$AppEventSignedInImpl();

  @override
  String toString() {
    return 'AppEvent.signedIn()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AppEventSignedInImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;
}

abstract class AppEventSignedIn implements AppEvent {
  const factory AppEventSignedIn() = _$AppEventSignedInImpl;
}

/// @nodoc
abstract class _$$AppEventSignOutRequestedImplCopyWith<$Res> {
  factory _$$AppEventSignOutRequestedImplCopyWith(
          _$AppEventSignOutRequestedImpl value,
          $Res Function(_$AppEventSignOutRequestedImpl) then) =
      __$$AppEventSignOutRequestedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AppEventSignOutRequestedImplCopyWithImpl<$Res>
    extends _$AppEventCopyWithImpl<$Res, _$AppEventSignOutRequestedImpl>
    implements _$$AppEventSignOutRequestedImplCopyWith<$Res> {
  __$$AppEventSignOutRequestedImplCopyWithImpl(
      _$AppEventSignOutRequestedImpl _value,
      $Res Function(_$AppEventSignOutRequestedImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$AppEventSignOutRequestedImpl implements AppEventSignOutRequested {
  const _$AppEventSignOutRequestedImpl();

  @override
  String toString() {
    return 'AppEvent.signOutRequested()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppEventSignOutRequestedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;
}

abstract class AppEventSignOutRequested implements AppEvent {
  const factory AppEventSignOutRequested() = _$AppEventSignOutRequestedImpl;
}

/// @nodoc
abstract class _$$AppEventSessionExpiredImplCopyWith<$Res> {
  factory _$$AppEventSessionExpiredImplCopyWith(
          _$AppEventSessionExpiredImpl value,
          $Res Function(_$AppEventSessionExpiredImpl) then) =
      __$$AppEventSessionExpiredImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AppEventSessionExpiredImplCopyWithImpl<$Res>
    extends _$AppEventCopyWithImpl<$Res, _$AppEventSessionExpiredImpl>
    implements _$$AppEventSessionExpiredImplCopyWith<$Res> {
  __$$AppEventSessionExpiredImplCopyWithImpl(
      _$AppEventSessionExpiredImpl _value,
      $Res Function(_$AppEventSessionExpiredImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$AppEventSessionExpiredImpl implements _AppEventSessionExpired {
  const _$AppEventSessionExpiredImpl();

  @override
  String toString() {
    return 'AppEvent.sessionExpired()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppEventSessionExpiredImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;
}

abstract class _AppEventSessionExpired implements AppEvent {
  const factory _AppEventSessionExpired() = _$AppEventSessionExpiredImpl;
}

/// @nodoc
mixin _$AppState {
  bool get isSignedIn => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;

  /// Create a copy of AppState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AppStateCopyWith<AppState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppStateCopyWith<$Res> {
  factory $AppStateCopyWith(AppState value, $Res Function(AppState) then) =
      _$AppStateCopyWithImpl<$Res, AppState>;
  @useResult
  $Res call({bool isSignedIn, String? error});
}

/// @nodoc
class _$AppStateCopyWithImpl<$Res, $Val extends AppState>
    implements $AppStateCopyWith<$Res> {
  _$AppStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AppState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isSignedIn = null,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      isSignedIn: null == isSignedIn
          ? _value.isSignedIn
          : isSignedIn // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AppStateImplCopyWith<$Res>
    implements $AppStateCopyWith<$Res> {
  factory _$$AppStateImplCopyWith(
          _$AppStateImpl value, $Res Function(_$AppStateImpl) then) =
      __$$AppStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isSignedIn, String? error});
}

/// @nodoc
class __$$AppStateImplCopyWithImpl<$Res>
    extends _$AppStateCopyWithImpl<$Res, _$AppStateImpl>
    implements _$$AppStateImplCopyWith<$Res> {
  __$$AppStateImplCopyWithImpl(
      _$AppStateImpl _value, $Res Function(_$AppStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isSignedIn = null,
    Object? error = freezed,
  }) {
    return _then(_$AppStateImpl(
      isSignedIn: null == isSignedIn
          ? _value.isSignedIn
          : isSignedIn // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$AppStateImpl implements _AppState {
  const _$AppStateImpl({required this.isSignedIn, this.error});

  @override
  final bool isSignedIn;
  @override
  final String? error;

  @override
  String toString() {
    return 'AppState(isSignedIn: $isSignedIn, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppStateImpl &&
            (identical(other.isSignedIn, isSignedIn) ||
                other.isSignedIn == isSignedIn) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isSignedIn, error);

  /// Create a copy of AppState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AppStateImplCopyWith<_$AppStateImpl> get copyWith =>
      __$$AppStateImplCopyWithImpl<_$AppStateImpl>(this, _$identity);
}

abstract class _AppState implements AppState {
  const factory _AppState(
      {required final bool isSignedIn, final String? error}) = _$AppStateImpl;

  @override
  bool get isSignedIn;
  @override
  String? get error;

  /// Create a copy of AppState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AppStateImplCopyWith<_$AppStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
