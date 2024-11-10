import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../../api/database.dart';
import '../../../../../api/entity/violation/violation.dart';
import '../../../../entity/status.dart';

part 'violations_bloc.freezed.dart';
part 'violations_event.dart';
part 'violations_state.dart';

class ViolationsBloc extends Bloc<ViolationsEvent, ViolationsState> {
  ViolationsBloc({
    required final int id,
    final List<Violation>? violations,
  }) : super(
          ViolationsState(
            id: id,
            violations: violations == null ? const StatusOfLoading() : StatusOfData(violations),
          ),
        ) {
    on<ViolationsEvent>(
      (final event, final emit) async {
        return switch (event) {
          ViolationsEventLoadRequested() => _onViolationsLoadRequested(event, emit),
        };
      },
      transformer: concurrent(),
    );

    _violationsSubscription = db
        .channel(Violation.tableName)
        .onPostgresChanges(
          table: Violation.tableName,
          event: PostgresChangeEvent.all,
          callback: (final _) => add(const ViolationsEventLoadRequested()),
        )
        .subscribe();

    if (state.violations is StatusOfLoading) {
      add(const ViolationsEventLoadRequested());
    }
  }

  RealtimeChannel? _violationsSubscription;

  Future<void> _onViolationsLoadRequested(final ViolationsEventLoadRequested event, final Emitter<ViolationsState> emit) async {
    try {
      emit(state.copyWith(violations: const StatusOfLoading()));

      final violations = await db.from(Violation.tableName).select(Violation.fieldNames).eq('record', state.id).withConverter(Violation.converter) ?? List.empty();

      emit(
        state.copyWith(
          violations: StatusOfData(
            violations,
          ),
        ),
      );
    } on Exception catch (e) {
      emit(state.copyWith(violations: StatusOfError(e.toString())));
    }
  }

  @override
  Future<void> close() {
    _violationsSubscription?.unsubscribe();
    return super.close();
  }
}
