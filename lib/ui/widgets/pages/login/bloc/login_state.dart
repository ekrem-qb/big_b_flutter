part of 'login_bloc.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState({
    @Default('') final String email,
    final String? emailError,
    @Default('') final String password,
    final String? passwordError,
    @Default(false) final bool isPasswordVisible,
    @Default(OperationStatusInitial()) final OperationStatus loginStatus,
  }) = _LoginStateSignedIn;
}
