part of 'rules_bloc.dart';

@freezed
sealed class RulesEvent with _$RulesEvent {
  const factory RulesEvent.loadRequested() = RulesEventLoadRequested;
}
