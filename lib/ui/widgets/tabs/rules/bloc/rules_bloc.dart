import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../../api/database.dart';
import '../../../../../api/entity/rule/rule.dart';

part 'rules_bloc.freezed.dart';
part 'rules_event.dart';
part 'rules_state.dart';

class RulesBloc extends Bloc<RulesEvent, RulesState> {
  RulesBloc() : super(const RulesStateLoading()) {
    on<RulesEvent>((final event, final emit) {
      return switch (event) {
        RulesEventLoadRequested() => _onLoadRequested(emit, event),
        _RulesEventDataUpdated() => _onDataUpdated(emit, event),
      };
    });

    _rulesSubscriptions = [
      db
          .channel(Rule.tableName)
          .onPostgresChanges(
            table: Rule.tableName,
            event: PostgresChangeEvent.all,
            callback: (final payload) => add(_RulesEventDataUpdated(payload: payload)),
          )
          .subscribe(),
    ];

    add(const RulesEventLoadRequested());
  }

  late final List<RealtimeChannel> _rulesSubscriptions;

  Future<void> _onLoadRequested(final Emitter<RulesState> emit, final RulesEventLoadRequested event) async {
    try {
      if (state is RulesStateError) {
        emit(const RulesState.loading());
      }

      final rules = await db.from(Rule.tableName).select(Rule.fieldNames).order($RuleImplJsonKeys.description, ascending: true).withConverter(Rule.converter) ?? List.empty();
      emit(RulesStateData(rules: rules));
    } on Exception catch (e) {
      emit(RulesStateError(error: e.toString()));
    }
  }

  Future<void> _onDataUpdated(final Emitter<RulesState> emit, final _RulesEventDataUpdated event) async {
    final currentState = state;
    if (currentState is! RulesStateData) return;

    final newRules = switch (event.payload.eventType) {
      PostgresChangeEvent.insert => _insert(Rule.fromJson(event.payload.newRecord), currentState.rules),
      PostgresChangeEvent.update => _insert(Rule.fromJson(event.payload.newRecord), _delete(event.payload.oldRecord[$RuleImplJsonKeys.id], currentState.rules) ?? currentState.rules),
      PostgresChangeEvent.delete => _delete(event.payload.oldRecord[$RuleImplJsonKeys.id], currentState.rules),
      _ => null,
    };

    if (newRules != null) {
      emit(currentState.copyWith(rules: newRules));
    }
  }

  List<Rule> _insert(final Rule newRule, final List<Rule> rules) {
    for (var i = 0; i < rules.length; i++) {
      if (newRule.description.compareTo(rules[i].description).isNegative) {
        return [
          ...rules.sublist(0, i),
          newRule,
          ...rules.sublist(i),
        ];
      }
    }

    return [
      ...rules,
      newRule,
    ];
  }

  List<Rule>? _delete(final int id, final List<Rule> rules) {
    for (var i = 0; i < rules.length; i++) {
      if (id == rules[i].id) {
        return [
          ...rules.sublist(0, i),
          ...rules.sublist(i + 1),
        ];
      }
    }

    return null;
  }

  @override
  Future<void> close() {
    for (var i = 0; i < _rulesSubscriptions.length; i++) {
      _rulesSubscriptions[i].unsubscribe();
    }
    return super.close();
  }
}
