import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../../api/database.dart';
import '../../../../../api/entity/violation/violation.dart';
import '../../../../../extensions/hash_generator.dart';
import '../../../../entity/status.dart';

part 'violation_viewer_bloc.freezed.dart';
part 'violation_viewer_event.dart';
part 'violation_viewer_state.dart';

class ViolationViewerBloc
    extends Bloc<ViolationViewerEvent, ViolationViewerState> {
  ViolationViewerBloc(final int id, final Violation? originalViolation)
    : super(
        ViolationViewerState(
          id: id,
          violation:
              originalViolation != null
                  ? StatusOfData(originalViolation)
                  : const StatusOfLoading(),
        ),
      ) {
    on<ViolationViewerEvent>((final event, final emit) {
      return switch (event) {
        ViolationViewerEventLoadRequested() => _onLoadRequested(event, emit),
      };
    });

    _dbSubscriptions = [
      db
          .channel(generateHash())
          .onPostgresChanges(
            table: Violation.tableName,
            event: PostgresChangeEvent.all,
            filter: PostgresChangeFilter(
              type: PostgresChangeFilterType.eq,
              column: $NormalViolationImplJsonKeys.id,
              value: id,
            ),
            callback: _reload,
          )
          .subscribe(),
      ...Violation.joinTables.map((final joinTable) {
        return db
            .channel(generateHash())
            .onPostgresChanges(
              table: joinTable.tableName,
              event: PostgresChangeEvent.update,
              callback: _reload,
            )
            .subscribe();
      }),
    ];

    if (state.violation is StatusOfLoading) {
      _reload();
    }
  }

  List<RealtimeChannel>? _dbSubscriptions;

  void _reload([final PostgresChangePayload? payload]) {
    add(const ViolationViewerEventLoadRequested());
  }

  Future<void> _onLoadRequested(
    final ViolationViewerEvent event,
    final Emitter<ViolationViewerState> emit,
  ) async {
    try {
      if (state.violation is StatusOfError) {
        emit(state.copyWith(violation: const StatusOfLoading()));
      }

      final violation = await db
          .from(Violation.tableName)
          .select(Violation.fieldNames)
          .eq($NormalViolationImplJsonKeys.id, state.id)
          .maybeSingle()
          .withConverter(Violation.maybeFromJson);

      if (violation == null) {
        emit(
          state.copyWith(violation: const StatusOfError('İhlal bulunamadı')),
        );
        return;
      }

      emit(state.copyWith(violation: StatusOfData(violation)));
    } catch (e) {
      emit(state.copyWith(violation: StatusOfError(e.toString())));
    }
  }

  @override
  Future<void> close() {
    final dbSubscriptions = _dbSubscriptions;
    if (dbSubscriptions != null) {
      for (var i = 0; i < dbSubscriptions.length; i++) {
        dbSubscriptions[i].unsubscribe();
      }
    }
    return super.close();
  }
}
