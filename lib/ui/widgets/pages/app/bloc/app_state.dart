part of 'app_bloc.dart';

@freezed
sealed class AppState with _$AppState {
  const factory AppState({
    required final bool isSignedIn,
    final String? error,
  }) = _AppState;
}
