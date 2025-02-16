part of 'login_bloc.dart';

@freezed
sealed class LoginEvent with _$LoginEvent {
  const factory LoginEvent.emailChanged(final String email) =
      LoginEventEmailChanged;
  const factory LoginEvent.passwordChanged(final String password) =
      LoginEventPasswordChanged;
  const factory LoginEvent.passwordVisibilityToggled() =
      LoginEventPasswordVisibilityToggled;
  const factory LoginEvent.loginRequested() = LoginEventLoginRequested;
}
