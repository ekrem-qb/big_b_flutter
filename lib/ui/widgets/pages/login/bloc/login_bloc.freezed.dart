// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$LoginEvent {}

/// @nodoc
abstract class $LoginEventCopyWith<$Res> {
  factory $LoginEventCopyWith(
    LoginEvent value,
    $Res Function(LoginEvent) then,
  ) = _$LoginEventCopyWithImpl<$Res, LoginEvent>;
}

/// @nodoc
class _$LoginEventCopyWithImpl<$Res, $Val extends LoginEvent>
    implements $LoginEventCopyWith<$Res> {
  _$LoginEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LoginEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$LoginEventEmailChangedImplCopyWith<$Res> {
  factory _$$LoginEventEmailChangedImplCopyWith(
    _$LoginEventEmailChangedImpl value,
    $Res Function(_$LoginEventEmailChangedImpl) then,
  ) = __$$LoginEventEmailChangedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String email});
}

/// @nodoc
class __$$LoginEventEmailChangedImplCopyWithImpl<$Res>
    extends _$LoginEventCopyWithImpl<$Res, _$LoginEventEmailChangedImpl>
    implements _$$LoginEventEmailChangedImplCopyWith<$Res> {
  __$$LoginEventEmailChangedImplCopyWithImpl(
    _$LoginEventEmailChangedImpl _value,
    $Res Function(_$LoginEventEmailChangedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of LoginEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? email = null}) {
    return _then(
      _$LoginEventEmailChangedImpl(
        null == email
            ? _value.email
            : email // ignore: cast_nullable_to_non_nullable
                as String,
      ),
    );
  }
}

/// @nodoc

class _$LoginEventEmailChangedImpl implements LoginEventEmailChanged {
  const _$LoginEventEmailChangedImpl(this.email);

  @override
  final String email;

  @override
  String toString() {
    return 'LoginEvent.emailChanged(email: $email)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginEventEmailChangedImpl &&
            (identical(other.email, email) || other.email == email));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email);

  /// Create a copy of LoginEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginEventEmailChangedImplCopyWith<_$LoginEventEmailChangedImpl>
  get copyWith =>
      __$$LoginEventEmailChangedImplCopyWithImpl<_$LoginEventEmailChangedImpl>(
        this,
        _$identity,
      );
}

abstract class LoginEventEmailChanged implements LoginEvent {
  const factory LoginEventEmailChanged(final String email) =
      _$LoginEventEmailChangedImpl;

  String get email;

  /// Create a copy of LoginEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoginEventEmailChangedImplCopyWith<_$LoginEventEmailChangedImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoginEventPasswordChangedImplCopyWith<$Res> {
  factory _$$LoginEventPasswordChangedImplCopyWith(
    _$LoginEventPasswordChangedImpl value,
    $Res Function(_$LoginEventPasswordChangedImpl) then,
  ) = __$$LoginEventPasswordChangedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String password});
}

/// @nodoc
class __$$LoginEventPasswordChangedImplCopyWithImpl<$Res>
    extends _$LoginEventCopyWithImpl<$Res, _$LoginEventPasswordChangedImpl>
    implements _$$LoginEventPasswordChangedImplCopyWith<$Res> {
  __$$LoginEventPasswordChangedImplCopyWithImpl(
    _$LoginEventPasswordChangedImpl _value,
    $Res Function(_$LoginEventPasswordChangedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of LoginEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? password = null}) {
    return _then(
      _$LoginEventPasswordChangedImpl(
        null == password
            ? _value.password
            : password // ignore: cast_nullable_to_non_nullable
                as String,
      ),
    );
  }
}

/// @nodoc

class _$LoginEventPasswordChangedImpl implements LoginEventPasswordChanged {
  const _$LoginEventPasswordChangedImpl(this.password);

  @override
  final String password;

  @override
  String toString() {
    return 'LoginEvent.passwordChanged(password: $password)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginEventPasswordChangedImpl &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @override
  int get hashCode => Object.hash(runtimeType, password);

  /// Create a copy of LoginEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginEventPasswordChangedImplCopyWith<_$LoginEventPasswordChangedImpl>
  get copyWith => __$$LoginEventPasswordChangedImplCopyWithImpl<
    _$LoginEventPasswordChangedImpl
  >(this, _$identity);
}

abstract class LoginEventPasswordChanged implements LoginEvent {
  const factory LoginEventPasswordChanged(final String password) =
      _$LoginEventPasswordChangedImpl;

  String get password;

  /// Create a copy of LoginEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoginEventPasswordChangedImplCopyWith<_$LoginEventPasswordChangedImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoginEventPasswordVisibilityToggledImplCopyWith<$Res> {
  factory _$$LoginEventPasswordVisibilityToggledImplCopyWith(
    _$LoginEventPasswordVisibilityToggledImpl value,
    $Res Function(_$LoginEventPasswordVisibilityToggledImpl) then,
  ) = __$$LoginEventPasswordVisibilityToggledImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoginEventPasswordVisibilityToggledImplCopyWithImpl<$Res>
    extends
        _$LoginEventCopyWithImpl<
          $Res,
          _$LoginEventPasswordVisibilityToggledImpl
        >
    implements _$$LoginEventPasswordVisibilityToggledImplCopyWith<$Res> {
  __$$LoginEventPasswordVisibilityToggledImplCopyWithImpl(
    _$LoginEventPasswordVisibilityToggledImpl _value,
    $Res Function(_$LoginEventPasswordVisibilityToggledImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of LoginEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoginEventPasswordVisibilityToggledImpl
    implements LoginEventPasswordVisibilityToggled {
  const _$LoginEventPasswordVisibilityToggledImpl();

  @override
  String toString() {
    return 'LoginEvent.passwordVisibilityToggled()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginEventPasswordVisibilityToggledImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;
}

abstract class LoginEventPasswordVisibilityToggled implements LoginEvent {
  const factory LoginEventPasswordVisibilityToggled() =
      _$LoginEventPasswordVisibilityToggledImpl;
}

/// @nodoc
abstract class _$$LoginEventLoginRequestedImplCopyWith<$Res> {
  factory _$$LoginEventLoginRequestedImplCopyWith(
    _$LoginEventLoginRequestedImpl value,
    $Res Function(_$LoginEventLoginRequestedImpl) then,
  ) = __$$LoginEventLoginRequestedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoginEventLoginRequestedImplCopyWithImpl<$Res>
    extends _$LoginEventCopyWithImpl<$Res, _$LoginEventLoginRequestedImpl>
    implements _$$LoginEventLoginRequestedImplCopyWith<$Res> {
  __$$LoginEventLoginRequestedImplCopyWithImpl(
    _$LoginEventLoginRequestedImpl _value,
    $Res Function(_$LoginEventLoginRequestedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of LoginEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoginEventLoginRequestedImpl implements LoginEventLoginRequested {
  const _$LoginEventLoginRequestedImpl();

  @override
  String toString() {
    return 'LoginEvent.loginRequested()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginEventLoginRequestedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;
}

abstract class LoginEventLoginRequested implements LoginEvent {
  const factory LoginEventLoginRequested() = _$LoginEventLoginRequestedImpl;
}

/// @nodoc
mixin _$LoginState {
  String get email => throw _privateConstructorUsedError;
  String? get emailError => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  String? get passwordError => throw _privateConstructorUsedError;
  bool get isPasswordVisible => throw _privateConstructorUsedError;
  OperationStatus<String> get loginStatus => throw _privateConstructorUsedError;

  /// Create a copy of LoginState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LoginStateCopyWith<LoginState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginStateCopyWith<$Res> {
  factory $LoginStateCopyWith(
    LoginState value,
    $Res Function(LoginState) then,
  ) = _$LoginStateCopyWithImpl<$Res, LoginState>;
  @useResult
  $Res call({
    String email,
    String? emailError,
    String password,
    String? passwordError,
    bool isPasswordVisible,
    OperationStatus<String> loginStatus,
  });

  $OperationStatusCopyWith<String, $Res> get loginStatus;
}

/// @nodoc
class _$LoginStateCopyWithImpl<$Res, $Val extends LoginState>
    implements $LoginStateCopyWith<$Res> {
  _$LoginStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LoginState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? emailError = freezed,
    Object? password = null,
    Object? passwordError = freezed,
    Object? isPasswordVisible = null,
    Object? loginStatus = null,
  }) {
    return _then(
      _value.copyWith(
            email:
                null == email
                    ? _value.email
                    : email // ignore: cast_nullable_to_non_nullable
                        as String,
            emailError:
                freezed == emailError
                    ? _value.emailError
                    : emailError // ignore: cast_nullable_to_non_nullable
                        as String?,
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
            loginStatus:
                null == loginStatus
                    ? _value.loginStatus
                    : loginStatus // ignore: cast_nullable_to_non_nullable
                        as OperationStatus<String>,
          )
          as $Val,
    );
  }

  /// Create a copy of LoginState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $OperationStatusCopyWith<String, $Res> get loginStatus {
    return $OperationStatusCopyWith<String, $Res>(_value.loginStatus, (value) {
      return _then(_value.copyWith(loginStatus: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$LoginStateSignedInImplCopyWith<$Res>
    implements $LoginStateCopyWith<$Res> {
  factory _$$LoginStateSignedInImplCopyWith(
    _$LoginStateSignedInImpl value,
    $Res Function(_$LoginStateSignedInImpl) then,
  ) = __$$LoginStateSignedInImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String email,
    String? emailError,
    String password,
    String? passwordError,
    bool isPasswordVisible,
    OperationStatus<String> loginStatus,
  });

  @override
  $OperationStatusCopyWith<String, $Res> get loginStatus;
}

/// @nodoc
class __$$LoginStateSignedInImplCopyWithImpl<$Res>
    extends _$LoginStateCopyWithImpl<$Res, _$LoginStateSignedInImpl>
    implements _$$LoginStateSignedInImplCopyWith<$Res> {
  __$$LoginStateSignedInImplCopyWithImpl(
    _$LoginStateSignedInImpl _value,
    $Res Function(_$LoginStateSignedInImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of LoginState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? emailError = freezed,
    Object? password = null,
    Object? passwordError = freezed,
    Object? isPasswordVisible = null,
    Object? loginStatus = null,
  }) {
    return _then(
      _$LoginStateSignedInImpl(
        email:
            null == email
                ? _value.email
                : email // ignore: cast_nullable_to_non_nullable
                    as String,
        emailError:
            freezed == emailError
                ? _value.emailError
                : emailError // ignore: cast_nullable_to_non_nullable
                    as String?,
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
        loginStatus:
            null == loginStatus
                ? _value.loginStatus
                : loginStatus // ignore: cast_nullable_to_non_nullable
                    as OperationStatus<String>,
      ),
    );
  }
}

/// @nodoc

class _$LoginStateSignedInImpl implements _LoginStateSignedIn {
  const _$LoginStateSignedInImpl({
    this.email = '',
    this.emailError,
    this.password = '',
    this.passwordError,
    this.isPasswordVisible = false,
    this.loginStatus = const OperationStatusInitial(),
  });

  @override
  @JsonKey()
  final String email;
  @override
  final String? emailError;
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
  final OperationStatus<String> loginStatus;

  @override
  String toString() {
    return 'LoginState(email: $email, emailError: $emailError, password: $password, passwordError: $passwordError, isPasswordVisible: $isPasswordVisible, loginStatus: $loginStatus)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginStateSignedInImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.emailError, emailError) ||
                other.emailError == emailError) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.passwordError, passwordError) ||
                other.passwordError == passwordError) &&
            (identical(other.isPasswordVisible, isPasswordVisible) ||
                other.isPasswordVisible == isPasswordVisible) &&
            (identical(other.loginStatus, loginStatus) ||
                other.loginStatus == loginStatus));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    email,
    emailError,
    password,
    passwordError,
    isPasswordVisible,
    loginStatus,
  );

  /// Create a copy of LoginState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginStateSignedInImplCopyWith<_$LoginStateSignedInImpl> get copyWith =>
      __$$LoginStateSignedInImplCopyWithImpl<_$LoginStateSignedInImpl>(
        this,
        _$identity,
      );
}

abstract class _LoginStateSignedIn implements LoginState {
  const factory _LoginStateSignedIn({
    final String email,
    final String? emailError,
    final String password,
    final String? passwordError,
    final bool isPasswordVisible,
    final OperationStatus<String> loginStatus,
  }) = _$LoginStateSignedInImpl;

  @override
  String get email;
  @override
  String? get emailError;
  @override
  String get password;
  @override
  String? get passwordError;
  @override
  bool get isPasswordVisible;
  @override
  OperationStatus<String> get loginStatus;

  /// Create a copy of LoginState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoginStateSignedInImplCopyWith<_$LoginStateSignedInImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
