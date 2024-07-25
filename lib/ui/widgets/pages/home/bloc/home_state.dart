part of 'home_bloc.dart';

enum AuthStatus {
  signedIn,
  signedOut,
}

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    @Default(0) final int selectedTabIndex,
    @Default(AuthStatus.signedIn) final AuthStatus authStatus,
  }) = _HomeState;
}
