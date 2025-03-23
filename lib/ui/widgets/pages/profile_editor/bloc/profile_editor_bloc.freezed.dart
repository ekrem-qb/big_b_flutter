// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_editor_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$ProfileEditorEvent {}

/// @nodoc
abstract class $ProfileEditorEventCopyWith<$Res> {
  factory $ProfileEditorEventCopyWith(
    ProfileEditorEvent value,
    $Res Function(ProfileEditorEvent) then,
  ) = _$ProfileEditorEventCopyWithImpl<$Res, ProfileEditorEvent>;
}

/// @nodoc
class _$ProfileEditorEventCopyWithImpl<$Res, $Val extends ProfileEditorEvent>
    implements $ProfileEditorEventCopyWith<$Res> {
  _$ProfileEditorEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProfileEditorEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$ProfileEditorEventLoadRequestedImplCopyWith<$Res> {
  factory _$$ProfileEditorEventLoadRequestedImplCopyWith(
    _$ProfileEditorEventLoadRequestedImpl value,
    $Res Function(_$ProfileEditorEventLoadRequestedImpl) then,
  ) = __$$ProfileEditorEventLoadRequestedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ProfileEditorEventLoadRequestedImplCopyWithImpl<$Res>
    extends
        _$ProfileEditorEventCopyWithImpl<
          $Res,
          _$ProfileEditorEventLoadRequestedImpl
        >
    implements _$$ProfileEditorEventLoadRequestedImplCopyWith<$Res> {
  __$$ProfileEditorEventLoadRequestedImplCopyWithImpl(
    _$ProfileEditorEventLoadRequestedImpl _value,
    $Res Function(_$ProfileEditorEventLoadRequestedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ProfileEditorEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ProfileEditorEventLoadRequestedImpl
    implements ProfileEditorEventLoadRequested {
  const _$ProfileEditorEventLoadRequestedImpl();

  @override
  String toString() {
    return 'ProfileEditorEvent.loadRequested()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfileEditorEventLoadRequestedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;
}

abstract class ProfileEditorEventLoadRequested implements ProfileEditorEvent {
  const factory ProfileEditorEventLoadRequested() =
      _$ProfileEditorEventLoadRequestedImpl;
}

/// @nodoc
abstract class _$$ProfileEditorEventNameChangedImplCopyWith<$Res> {
  factory _$$ProfileEditorEventNameChangedImplCopyWith(
    _$ProfileEditorEventNameChangedImpl value,
    $Res Function(_$ProfileEditorEventNameChangedImpl) then,
  ) = __$$ProfileEditorEventNameChangedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String value});
}

/// @nodoc
class __$$ProfileEditorEventNameChangedImplCopyWithImpl<$Res>
    extends
        _$ProfileEditorEventCopyWithImpl<
          $Res,
          _$ProfileEditorEventNameChangedImpl
        >
    implements _$$ProfileEditorEventNameChangedImplCopyWith<$Res> {
  __$$ProfileEditorEventNameChangedImplCopyWithImpl(
    _$ProfileEditorEventNameChangedImpl _value,
    $Res Function(_$ProfileEditorEventNameChangedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ProfileEditorEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? value = null}) {
    return _then(
      _$ProfileEditorEventNameChangedImpl(
        null == value
            ? _value.value
            : value // ignore: cast_nullable_to_non_nullable
                as String,
      ),
    );
  }
}

/// @nodoc

class _$ProfileEditorEventNameChangedImpl
    implements ProfileEditorEventNameChanged {
  const _$ProfileEditorEventNameChangedImpl(this.value);

  @override
  final String value;

  @override
  String toString() {
    return 'ProfileEditorEvent.nameChanged(value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfileEditorEventNameChangedImpl &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  /// Create a copy of ProfileEditorEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProfileEditorEventNameChangedImplCopyWith<
    _$ProfileEditorEventNameChangedImpl
  >
  get copyWith => __$$ProfileEditorEventNameChangedImplCopyWithImpl<
    _$ProfileEditorEventNameChangedImpl
  >(this, _$identity);
}

abstract class ProfileEditorEventNameChanged implements ProfileEditorEvent {
  const factory ProfileEditorEventNameChanged(final String value) =
      _$ProfileEditorEventNameChangedImpl;

  String get value;

  /// Create a copy of ProfileEditorEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProfileEditorEventNameChangedImplCopyWith<
    _$ProfileEditorEventNameChangedImpl
  >
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ProfileEditorEventLoginChangedImplCopyWith<$Res> {
  factory _$$ProfileEditorEventLoginChangedImplCopyWith(
    _$ProfileEditorEventLoginChangedImpl value,
    $Res Function(_$ProfileEditorEventLoginChangedImpl) then,
  ) = __$$ProfileEditorEventLoginChangedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String value});
}

/// @nodoc
class __$$ProfileEditorEventLoginChangedImplCopyWithImpl<$Res>
    extends
        _$ProfileEditorEventCopyWithImpl<
          $Res,
          _$ProfileEditorEventLoginChangedImpl
        >
    implements _$$ProfileEditorEventLoginChangedImplCopyWith<$Res> {
  __$$ProfileEditorEventLoginChangedImplCopyWithImpl(
    _$ProfileEditorEventLoginChangedImpl _value,
    $Res Function(_$ProfileEditorEventLoginChangedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ProfileEditorEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? value = null}) {
    return _then(
      _$ProfileEditorEventLoginChangedImpl(
        null == value
            ? _value.value
            : value // ignore: cast_nullable_to_non_nullable
                as String,
      ),
    );
  }
}

/// @nodoc

class _$ProfileEditorEventLoginChangedImpl
    implements ProfileEditorEventLoginChanged {
  const _$ProfileEditorEventLoginChangedImpl(this.value);

  @override
  final String value;

  @override
  String toString() {
    return 'ProfileEditorEvent.loginChanged(value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfileEditorEventLoginChangedImpl &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  /// Create a copy of ProfileEditorEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProfileEditorEventLoginChangedImplCopyWith<
    _$ProfileEditorEventLoginChangedImpl
  >
  get copyWith => __$$ProfileEditorEventLoginChangedImplCopyWithImpl<
    _$ProfileEditorEventLoginChangedImpl
  >(this, _$identity);
}

abstract class ProfileEditorEventLoginChanged implements ProfileEditorEvent {
  const factory ProfileEditorEventLoginChanged(final String value) =
      _$ProfileEditorEventLoginChangedImpl;

  String get value;

  /// Create a copy of ProfileEditorEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProfileEditorEventLoginChangedImplCopyWith<
    _$ProfileEditorEventLoginChangedImpl
  >
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ProfileEditorEventPasswordChangedImplCopyWith<$Res> {
  factory _$$ProfileEditorEventPasswordChangedImplCopyWith(
    _$ProfileEditorEventPasswordChangedImpl value,
    $Res Function(_$ProfileEditorEventPasswordChangedImpl) then,
  ) = __$$ProfileEditorEventPasswordChangedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String value});
}

/// @nodoc
class __$$ProfileEditorEventPasswordChangedImplCopyWithImpl<$Res>
    extends
        _$ProfileEditorEventCopyWithImpl<
          $Res,
          _$ProfileEditorEventPasswordChangedImpl
        >
    implements _$$ProfileEditorEventPasswordChangedImplCopyWith<$Res> {
  __$$ProfileEditorEventPasswordChangedImplCopyWithImpl(
    _$ProfileEditorEventPasswordChangedImpl _value,
    $Res Function(_$ProfileEditorEventPasswordChangedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ProfileEditorEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? value = null}) {
    return _then(
      _$ProfileEditorEventPasswordChangedImpl(
        null == value
            ? _value.value
            : value // ignore: cast_nullable_to_non_nullable
                as String,
      ),
    );
  }
}

/// @nodoc

class _$ProfileEditorEventPasswordChangedImpl
    implements ProfileEditorEventPasswordChanged {
  const _$ProfileEditorEventPasswordChangedImpl(this.value);

  @override
  final String value;

  @override
  String toString() {
    return 'ProfileEditorEvent.passwordChanged(value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfileEditorEventPasswordChangedImpl &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  /// Create a copy of ProfileEditorEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProfileEditorEventPasswordChangedImplCopyWith<
    _$ProfileEditorEventPasswordChangedImpl
  >
  get copyWith => __$$ProfileEditorEventPasswordChangedImplCopyWithImpl<
    _$ProfileEditorEventPasswordChangedImpl
  >(this, _$identity);
}

abstract class ProfileEditorEventPasswordChanged implements ProfileEditorEvent {
  const factory ProfileEditorEventPasswordChanged(final String value) =
      _$ProfileEditorEventPasswordChangedImpl;

  String get value;

  /// Create a copy of ProfileEditorEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProfileEditorEventPasswordChangedImplCopyWith<
    _$ProfileEditorEventPasswordChangedImpl
  >
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ProfileEditorEventPasswordVisibilityToggledImplCopyWith<
  $Res
> {
  factory _$$ProfileEditorEventPasswordVisibilityToggledImplCopyWith(
    _$ProfileEditorEventPasswordVisibilityToggledImpl value,
    $Res Function(_$ProfileEditorEventPasswordVisibilityToggledImpl) then,
  ) = __$$ProfileEditorEventPasswordVisibilityToggledImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ProfileEditorEventPasswordVisibilityToggledImplCopyWithImpl<$Res>
    extends
        _$ProfileEditorEventCopyWithImpl<
          $Res,
          _$ProfileEditorEventPasswordVisibilityToggledImpl
        >
    implements
        _$$ProfileEditorEventPasswordVisibilityToggledImplCopyWith<$Res> {
  __$$ProfileEditorEventPasswordVisibilityToggledImplCopyWithImpl(
    _$ProfileEditorEventPasswordVisibilityToggledImpl _value,
    $Res Function(_$ProfileEditorEventPasswordVisibilityToggledImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ProfileEditorEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ProfileEditorEventPasswordVisibilityToggledImpl
    implements ProfileEditorEventPasswordVisibilityToggled {
  const _$ProfileEditorEventPasswordVisibilityToggledImpl();

  @override
  String toString() {
    return 'ProfileEditorEvent.passwordVisibilityToggled()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfileEditorEventPasswordVisibilityToggledImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;
}

abstract class ProfileEditorEventPasswordVisibilityToggled
    implements ProfileEditorEvent {
  const factory ProfileEditorEventPasswordVisibilityToggled() =
      _$ProfileEditorEventPasswordVisibilityToggledImpl;
}

/// @nodoc
abstract class _$$ProfileEditorEventRoleChangedImplCopyWith<$Res> {
  factory _$$ProfileEditorEventRoleChangedImplCopyWith(
    _$ProfileEditorEventRoleChangedImpl value,
    $Res Function(_$ProfileEditorEventRoleChangedImpl) then,
  ) = __$$ProfileEditorEventRoleChangedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Role value});
}

/// @nodoc
class __$$ProfileEditorEventRoleChangedImplCopyWithImpl<$Res>
    extends
        _$ProfileEditorEventCopyWithImpl<
          $Res,
          _$ProfileEditorEventRoleChangedImpl
        >
    implements _$$ProfileEditorEventRoleChangedImplCopyWith<$Res> {
  __$$ProfileEditorEventRoleChangedImplCopyWithImpl(
    _$ProfileEditorEventRoleChangedImpl _value,
    $Res Function(_$ProfileEditorEventRoleChangedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ProfileEditorEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? value = null}) {
    return _then(
      _$ProfileEditorEventRoleChangedImpl(
        null == value
            ? _value.value
            : value // ignore: cast_nullable_to_non_nullable
                as Role,
      ),
    );
  }
}

/// @nodoc

class _$ProfileEditorEventRoleChangedImpl
    implements ProfileEditorEventRoleChanged {
  const _$ProfileEditorEventRoleChangedImpl(this.value);

  @override
  final Role value;

  @override
  String toString() {
    return 'ProfileEditorEvent.roleChanged(value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfileEditorEventRoleChangedImpl &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  /// Create a copy of ProfileEditorEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProfileEditorEventRoleChangedImplCopyWith<
    _$ProfileEditorEventRoleChangedImpl
  >
  get copyWith => __$$ProfileEditorEventRoleChangedImplCopyWithImpl<
    _$ProfileEditorEventRoleChangedImpl
  >(this, _$identity);
}

abstract class ProfileEditorEventRoleChanged implements ProfileEditorEvent {
  const factory ProfileEditorEventRoleChanged(final Role value) =
      _$ProfileEditorEventRoleChangedImpl;

  Role get value;

  /// Create a copy of ProfileEditorEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProfileEditorEventRoleChangedImplCopyWith<
    _$ProfileEditorEventRoleChangedImpl
  >
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ProfileEditorEventSaveRequestedImplCopyWith<$Res> {
  factory _$$ProfileEditorEventSaveRequestedImplCopyWith(
    _$ProfileEditorEventSaveRequestedImpl value,
    $Res Function(_$ProfileEditorEventSaveRequestedImpl) then,
  ) = __$$ProfileEditorEventSaveRequestedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ProfileEditorEventSaveRequestedImplCopyWithImpl<$Res>
    extends
        _$ProfileEditorEventCopyWithImpl<
          $Res,
          _$ProfileEditorEventSaveRequestedImpl
        >
    implements _$$ProfileEditorEventSaveRequestedImplCopyWith<$Res> {
  __$$ProfileEditorEventSaveRequestedImplCopyWithImpl(
    _$ProfileEditorEventSaveRequestedImpl _value,
    $Res Function(_$ProfileEditorEventSaveRequestedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ProfileEditorEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ProfileEditorEventSaveRequestedImpl
    implements ProfileEditorEventSaveRequested {
  const _$ProfileEditorEventSaveRequestedImpl();

  @override
  String toString() {
    return 'ProfileEditorEvent.saveRequested()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfileEditorEventSaveRequestedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;
}

abstract class ProfileEditorEventSaveRequested implements ProfileEditorEvent {
  const factory ProfileEditorEventSaveRequested() =
      _$ProfileEditorEventSaveRequestedImpl;
}

/// @nodoc
abstract class _$$ProfileEditorEventDeleteRequestedImplCopyWith<$Res> {
  factory _$$ProfileEditorEventDeleteRequestedImplCopyWith(
    _$ProfileEditorEventDeleteRequestedImpl value,
    $Res Function(_$ProfileEditorEventDeleteRequestedImpl) then,
  ) = __$$ProfileEditorEventDeleteRequestedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ProfileEditorEventDeleteRequestedImplCopyWithImpl<$Res>
    extends
        _$ProfileEditorEventCopyWithImpl<
          $Res,
          _$ProfileEditorEventDeleteRequestedImpl
        >
    implements _$$ProfileEditorEventDeleteRequestedImplCopyWith<$Res> {
  __$$ProfileEditorEventDeleteRequestedImplCopyWithImpl(
    _$ProfileEditorEventDeleteRequestedImpl _value,
    $Res Function(_$ProfileEditorEventDeleteRequestedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ProfileEditorEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ProfileEditorEventDeleteRequestedImpl
    implements ProfileEditorEventDeleteRequested {
  const _$ProfileEditorEventDeleteRequestedImpl();

  @override
  String toString() {
    return 'ProfileEditorEvent.deleteRequested()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfileEditorEventDeleteRequestedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;
}

abstract class ProfileEditorEventDeleteRequested implements ProfileEditorEvent {
  const factory ProfileEditorEventDeleteRequested() =
      _$ProfileEditorEventDeleteRequestedImpl;
}

/// @nodoc
mixin _$ProfileEditorState {
  String get name => throw _privateConstructorUsedError;
  String get login => throw _privateConstructorUsedError;
  Role get role => throw _privateConstructorUsedError;
  String? get nameError => throw _privateConstructorUsedError;
  OperationStatus get uploadState => throw _privateConstructorUsedError;

  /// Create a copy of ProfileEditorState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProfileEditorStateCopyWith<ProfileEditorState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileEditorStateCopyWith<$Res> {
  factory $ProfileEditorStateCopyWith(
    ProfileEditorState value,
    $Res Function(ProfileEditorState) then,
  ) = _$ProfileEditorStateCopyWithImpl<$Res, ProfileEditorState>;
  @useResult
  $Res call({
    String name,
    String login,
    Role role,
    String? nameError,
    OperationStatus uploadState,
  });

  $OperationStatusCopyWith<$Res> get uploadState;
}

/// @nodoc
class _$ProfileEditorStateCopyWithImpl<$Res, $Val extends ProfileEditorState>
    implements $ProfileEditorStateCopyWith<$Res> {
  _$ProfileEditorStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProfileEditorState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? login = null,
    Object? role = null,
    Object? nameError = freezed,
    Object? uploadState = null,
  }) {
    return _then(
      _value.copyWith(
            name:
                null == name
                    ? _value.name
                    : name // ignore: cast_nullable_to_non_nullable
                        as String,
            login:
                null == login
                    ? _value.login
                    : login // ignore: cast_nullable_to_non_nullable
                        as String,
            role:
                null == role
                    ? _value.role
                    : role // ignore: cast_nullable_to_non_nullable
                        as Role,
            nameError:
                freezed == nameError
                    ? _value.nameError
                    : nameError // ignore: cast_nullable_to_non_nullable
                        as String?,
            uploadState:
                null == uploadState
                    ? _value.uploadState
                    : uploadState // ignore: cast_nullable_to_non_nullable
                        as OperationStatus,
          )
          as $Val,
    );
  }

  /// Create a copy of ProfileEditorState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $OperationStatusCopyWith<$Res> get uploadState {
    return $OperationStatusCopyWith<$Res>(_value.uploadState, (value) {
      return _then(_value.copyWith(uploadState: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ProfileEditorStateEditImplCopyWith<$Res>
    implements $ProfileEditorStateCopyWith<$Res> {
  factory _$$ProfileEditorStateEditImplCopyWith(
    _$ProfileEditorStateEditImpl value,
    $Res Function(_$ProfileEditorStateEditImpl) then,
  ) = __$$ProfileEditorStateEditImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String uid,
    Status loadingState,
    String name,
    String login,
    Role role,
    String? nameError,
    OperationStatus uploadState,
    OperationStatus deleteState,
  });

  $StatusCopyWith<$Res> get loadingState;
  @override
  $OperationStatusCopyWith<$Res> get uploadState;
  $OperationStatusCopyWith<$Res> get deleteState;
}

/// @nodoc
class __$$ProfileEditorStateEditImplCopyWithImpl<$Res>
    extends _$ProfileEditorStateCopyWithImpl<$Res, _$ProfileEditorStateEditImpl>
    implements _$$ProfileEditorStateEditImplCopyWith<$Res> {
  __$$ProfileEditorStateEditImplCopyWithImpl(
    _$ProfileEditorStateEditImpl _value,
    $Res Function(_$ProfileEditorStateEditImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ProfileEditorState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
    Object? loadingState = null,
    Object? name = null,
    Object? login = null,
    Object? role = null,
    Object? nameError = freezed,
    Object? uploadState = null,
    Object? deleteState = null,
  }) {
    return _then(
      _$ProfileEditorStateEditImpl(
        uid:
            null == uid
                ? _value.uid
                : uid // ignore: cast_nullable_to_non_nullable
                    as String,
        loadingState:
            null == loadingState
                ? _value.loadingState
                : loadingState // ignore: cast_nullable_to_non_nullable
                    as Status,
        name:
            null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                    as String,
        login:
            null == login
                ? _value.login
                : login // ignore: cast_nullable_to_non_nullable
                    as String,
        role:
            null == role
                ? _value.role
                : role // ignore: cast_nullable_to_non_nullable
                    as Role,
        nameError:
            freezed == nameError
                ? _value.nameError
                : nameError // ignore: cast_nullable_to_non_nullable
                    as String?,
        uploadState:
            null == uploadState
                ? _value.uploadState
                : uploadState // ignore: cast_nullable_to_non_nullable
                    as OperationStatus,
        deleteState:
            null == deleteState
                ? _value.deleteState
                : deleteState // ignore: cast_nullable_to_non_nullable
                    as OperationStatus,
      ),
    );
  }

  /// Create a copy of ProfileEditorState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $StatusCopyWith<$Res> get loadingState {
    return $StatusCopyWith<$Res>(_value.loadingState, (value) {
      return _then(_value.copyWith(loadingState: value));
    });
  }

  /// Create a copy of ProfileEditorState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $OperationStatusCopyWith<$Res> get deleteState {
    return $OperationStatusCopyWith<$Res>(_value.deleteState, (value) {
      return _then(_value.copyWith(deleteState: value));
    });
  }
}

/// @nodoc

class _$ProfileEditorStateEditImpl implements ProfileEditorStateEdit {
  const _$ProfileEditorStateEditImpl({
    required this.uid,
    required this.loadingState,
    required this.name,
    required this.login,
    required this.role,
    this.nameError,
    this.uploadState = const OperationStatusInitial(),
    this.deleteState = const OperationStatusInitial(),
  });

  @override
  final String uid;
  @override
  final Status loadingState;
  @override
  final String name;
  @override
  final String login;
  @override
  final Role role;
  @override
  final String? nameError;
  @override
  @JsonKey()
  final OperationStatus uploadState;
  @override
  @JsonKey()
  final OperationStatus deleteState;

  @override
  String toString() {
    return 'ProfileEditorState.edit(uid: $uid, loadingState: $loadingState, name: $name, login: $login, role: $role, nameError: $nameError, uploadState: $uploadState, deleteState: $deleteState)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfileEditorStateEditImpl &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.loadingState, loadingState) ||
                other.loadingState == loadingState) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.login, login) || other.login == login) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.nameError, nameError) ||
                other.nameError == nameError) &&
            (identical(other.uploadState, uploadState) ||
                other.uploadState == uploadState) &&
            (identical(other.deleteState, deleteState) ||
                other.deleteState == deleteState));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    uid,
    loadingState,
    name,
    login,
    role,
    nameError,
    uploadState,
    deleteState,
  );

  /// Create a copy of ProfileEditorState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProfileEditorStateEditImplCopyWith<_$ProfileEditorStateEditImpl>
  get copyWith =>
      __$$ProfileEditorStateEditImplCopyWithImpl<_$ProfileEditorStateEditImpl>(
        this,
        _$identity,
      );
}

abstract class ProfileEditorStateEdit implements ProfileEditorState {
  const factory ProfileEditorStateEdit({
    required final String uid,
    required final Status loadingState,
    required final String name,
    required final String login,
    required final Role role,
    final String? nameError,
    final OperationStatus uploadState,
    final OperationStatus deleteState,
  }) = _$ProfileEditorStateEditImpl;

  String get uid;
  Status get loadingState;
  @override
  String get name;
  @override
  String get login;
  @override
  Role get role;
  @override
  String? get nameError;
  @override
  OperationStatus get uploadState;
  OperationStatus get deleteState;

  /// Create a copy of ProfileEditorState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProfileEditorStateEditImplCopyWith<_$ProfileEditorStateEditImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ProfileEditorStateCreateImplCopyWith<$Res>
    implements $ProfileEditorStateCopyWith<$Res> {
  factory _$$ProfileEditorStateCreateImplCopyWith(
    _$ProfileEditorStateCreateImpl value,
    $Res Function(_$ProfileEditorStateCreateImpl) then,
  ) = __$$ProfileEditorStateCreateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String name,
    String? nameError,
    String login,
    String? loginError,
    Role role,
    String password,
    String? passwordError,
    bool isPasswordVisible,
    OperationStatus uploadState,
  });

  @override
  $OperationStatusCopyWith<$Res> get uploadState;
}

/// @nodoc
class __$$ProfileEditorStateCreateImplCopyWithImpl<$Res>
    extends
        _$ProfileEditorStateCopyWithImpl<$Res, _$ProfileEditorStateCreateImpl>
    implements _$$ProfileEditorStateCreateImplCopyWith<$Res> {
  __$$ProfileEditorStateCreateImplCopyWithImpl(
    _$ProfileEditorStateCreateImpl _value,
    $Res Function(_$ProfileEditorStateCreateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ProfileEditorState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? nameError = freezed,
    Object? login = null,
    Object? loginError = freezed,
    Object? role = null,
    Object? password = null,
    Object? passwordError = freezed,
    Object? isPasswordVisible = null,
    Object? uploadState = null,
  }) {
    return _then(
      _$ProfileEditorStateCreateImpl(
        name:
            null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                    as String,
        nameError:
            freezed == nameError
                ? _value.nameError
                : nameError // ignore: cast_nullable_to_non_nullable
                    as String?,
        login:
            null == login
                ? _value.login
                : login // ignore: cast_nullable_to_non_nullable
                    as String,
        loginError:
            freezed == loginError
                ? _value.loginError
                : loginError // ignore: cast_nullable_to_non_nullable
                    as String?,
        role:
            null == role
                ? _value.role
                : role // ignore: cast_nullable_to_non_nullable
                    as Role,
        password:
            null == password
                ? _value.password
                : password // ignore: cast_nullable_to_non_nullable
                    as String,
        passwordError:
            freezed == passwordError
                ? _value.passwordError
                : passwordError // ignore: cast_nullable_to_non_nullable
                    as String?,
        isPasswordVisible:
            null == isPasswordVisible
                ? _value.isPasswordVisible
                : isPasswordVisible // ignore: cast_nullable_to_non_nullable
                    as bool,
        uploadState:
            null == uploadState
                ? _value.uploadState
                : uploadState // ignore: cast_nullable_to_non_nullable
                    as OperationStatus,
      ),
    );
  }
}

/// @nodoc

class _$ProfileEditorStateCreateImpl implements ProfileEditorStateCreate {
  const _$ProfileEditorStateCreateImpl({
    this.name = '',
    this.nameError,
    this.login = '',
    this.loginError,
    this.role = Role.employee,
    this.password = '',
    this.passwordError,
    this.isPasswordVisible = false,
    this.uploadState = const OperationStatusInitial(),
  });

  @override
  @JsonKey()
  final String name;
  @override
  final String? nameError;
  @override
  @JsonKey()
  final String login;
  @override
  final String? loginError;
  @override
  @JsonKey()
  final Role role;
  @override
  @JsonKey()
  final String password;
  @override
  final String? passwordError;
  @override
  @JsonKey()
  final bool isPasswordVisible;
  @override
  @JsonKey()
  final OperationStatus uploadState;

  @override
  String toString() {
    return 'ProfileEditorState.create(name: $name, nameError: $nameError, login: $login, loginError: $loginError, role: $role, password: $password, passwordError: $passwordError, isPasswordVisible: $isPasswordVisible, uploadState: $uploadState)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfileEditorStateCreateImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.nameError, nameError) ||
                other.nameError == nameError) &&
            (identical(other.login, login) || other.login == login) &&
            (identical(other.loginError, loginError) ||
                other.loginError == loginError) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.passwordError, passwordError) ||
                other.passwordError == passwordError) &&
            (identical(other.isPasswordVisible, isPasswordVisible) ||
                other.isPasswordVisible == isPasswordVisible) &&
            (identical(other.uploadState, uploadState) ||
                other.uploadState == uploadState));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    name,
    nameError,
    login,
    loginError,
    role,
    password,
    passwordError,
    isPasswordVisible,
    uploadState,
  );

  /// Create a copy of ProfileEditorState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProfileEditorStateCreateImplCopyWith<_$ProfileEditorStateCreateImpl>
  get copyWith => __$$ProfileEditorStateCreateImplCopyWithImpl<
    _$ProfileEditorStateCreateImpl
  >(this, _$identity);
}

abstract class ProfileEditorStateCreate implements ProfileEditorState {
  const factory ProfileEditorStateCreate({
    final String name,
    final String? nameError,
    final String login,
    final String? loginError,
    final Role role,
    final String password,
    final String? passwordError,
    final bool isPasswordVisible,
    final OperationStatus uploadState,
  }) = _$ProfileEditorStateCreateImpl;

  @override
  String get name;
  @override
  String? get nameError;
  @override
  String get login;
  String? get loginError;
  @override
  Role get role;
  String get password;
  String? get passwordError;
  bool get isPasswordVisible;
  @override
  OperationStatus get uploadState;

  /// Create a copy of ProfileEditorState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProfileEditorStateCreateImplCopyWith<_$ProfileEditorStateCreateImpl>
  get copyWith => throw _privateConstructorUsedError;
}
