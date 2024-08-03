import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_state.freezed.dart';
part 'home_state.g.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    @Default([]) final List<int> history,
  }) = _HomeState;

  factory HomeState.fromJson(final Map<String, dynamic> json) => _$HomeStateFromJson(json);
}
