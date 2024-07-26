part of 'home_bloc.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    @Default(0) final int selectedTabIndex,
  }) = _HomeState;

  factory HomeState.fromJson(final Map<String, dynamic> json) => _$HomeStateFromJson(json);
}
