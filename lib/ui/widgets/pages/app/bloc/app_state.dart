part of 'app_bloc.dart';

@freezed
sealed class AppState with _$AppState {
  const factory AppState.signedIn() = AppStateSignedIn;
  const factory AppState.signedOut() = AppStateSignedOut;
}
