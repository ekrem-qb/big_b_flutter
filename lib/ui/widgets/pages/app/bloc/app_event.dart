part of 'app_bloc.dart';

@freezed
sealed class AppEvent with _$AppEvent {
  const factory AppEvent.signedIn() = AppEventSignedIn;
  const factory AppEvent.signOutRequested() = AppEventSignOutRequested;
  const factory AppEvent.sessionExpired() = _AppEventSessionExpired;
}
