import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../../api/database.dart';
import '../../../../../api/entity/profile/profile.dart';
import '../../../../../api/entity/task/task.dart';
import '../../../../../extensions/hash_generator.dart';
import '../../../../entity/status.dart';

part 'task_viewer_bloc.freezed.dart';
part 'task_viewer_event.dart';
part 'task_viewer_state.dart';

class TaskViewerBloc extends Bloc<TaskViewerEvent, TaskViewerState> {
  TaskViewerBloc(final int id, final Task? originalTask)
      : super(
          TaskViewerState(
            id: id,
            task: originalTask != null ? StatusOfData(originalTask) : const StatusOfLoading(),
          ),
        ) {
    on<TaskViewerEvent>((final event, final emit) {
      return switch (event) {
        TaskViewerEventLoadRequested() => _onLoadRequested(event, emit),
        TaskViewerEventDeleteRequested() => _onDeleteRequested(event, emit),
      };
    });

    _dbSubscriptions = [
      db
          .channel(generateHash())
          .onPostgresChanges(
            table: Task.tableName,
            event: PostgresChangeEvent.all,
            filter: PostgresChangeFilter(type: PostgresChangeFilterType.eq, column: $TaskImplJsonKeys.id, value: id),
            callback: (final _) => add(const TaskViewerEventLoadRequested()),
          )
          .subscribe(),
      db
          .channel(generateHash())
          .onPostgresChanges(
            table: Task.executivesTableName,
            event: PostgresChangeEvent.all,
            filter: PostgresChangeFilter(type: PostgresChangeFilterType.eq, column: $TaskImplJsonKeys.id, value: id),
            callback: (final _) => add(const TaskViewerEventLoadRequested()),
          )
          .subscribe(),
      db
          .channel(generateHash())
          .onPostgresChanges(
            table: Profile.tableName,
            event: PostgresChangeEvent.update,
            callback: (final _) => add(const TaskViewerEventLoadRequested()),
          )
          .subscribe(),
    ];

    if (state.task is StatusOfLoading) {
      add(const TaskViewerEventLoadRequested());
    }
  }

  List<RealtimeChannel>? _dbSubscriptions;

  Future<void> _onLoadRequested(final TaskViewerEvent event, final Emitter<TaskViewerState> emit) async {
    try {
      if (state.task is StatusOfError) {
        emit(state.copyWith(task: const StatusOfLoading()));
      }

      final task = await db.from(Task.tableName).select(Task.fieldNames).eq($TaskImplJsonKeys.id, state.id).maybeSingle().withConverter(Task.maybeFromJson);

      if (task == null) {
        emit(state.copyWith(task: const StatusOfError('Görev bulunamadı')));
        return;
      }

      emit(state.copyWith(task: StatusOfData(task)));
    } catch (e) {
      emit(state.copyWith(task: StatusOfError(e.toString())));
    }
  }

  Future<void> _onDeleteRequested(final TaskViewerEventDeleteRequested event, final Emitter<TaskViewerState> emit) async {
    emit(
      state.copyWith(
        deleteState: const OperationStatusInProgress(),
      ),
    );

    try {
      await db.from(Task.tableName).delete().eq($TaskImplJsonKeys.id, state.id);

      emit(
        state.copyWith(
          deleteState: const OperationStatusCompleted(),
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          deleteState: OperationStatusError(e.toString()),
        ),
      );
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
