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
      };
    });

    add(const RulesEventLoadRequested());
  }

  late final List<RealtimeChannel> _rulesSubscriptions = [
    db
        .channel(Rule.tableName)
        .onPostgresChanges(
          table: Rule.tableName,
          event: PostgresChangeEvent.all,
          callback: (final _) => add(const RulesEventLoadRequested()),
        )
        .subscribe(),
  ];

  Future<void> _onLoadRequested(final Emitter<RulesState> emit, final RulesEventLoadRequested event) async {
    try {
      if (state is RulesStateError) {
        emit(const RulesState.loading());
      }

      final rules = await db.from(Rule.tableName).select(Rule.fieldNames).order($RuleImplJsonKeys.description).withConverter(Rule.converter) ?? List.empty();
      emit(RulesStateData(rules: rules));
    } on Exception catch (e) {
      emit(RulesStateError(error: e.toString()));
    }
  }

  @override
  Future<void> close() {
    for (var i = 0; i < _rulesSubscriptions.length; i++) {
      _rulesSubscriptions[i].unsubscribe();
    }
    return super.close();
  }
}
