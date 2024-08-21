part of 'rules_bloc.dart';

@freezed
sealed class RulesEvent with _$RulesEvent {
  const factory RulesEvent.loadRequested() = RulesEventLoadRequested;
  const factory RulesEvent.dataUpdated({required final PostgresChangePayload payload}) = _RulesEventDataUpdated;
}
