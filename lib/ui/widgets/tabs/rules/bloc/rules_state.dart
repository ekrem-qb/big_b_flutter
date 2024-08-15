part of 'rules_bloc.dart';

@freezed
sealed class RulesState with _$RulesState {
  const factory RulesState.data({
    required final List<Rule> rules,
  }) = RulesStateData;

  const factory RulesState.loading() = RulesStateLoading;

  const factory RulesState.error({
    required final String error,
  }) = RulesStateError;
}
