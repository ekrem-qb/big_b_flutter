part of 'home_bloc.dart';

@freezed
sealed class HomeEvent with _$HomeEvent {
  const factory HomeEvent.tabChanged(final int index) = HomeTabChanged;
  const factory HomeEvent.signedOut() = _HomeSignedOut;
}
