import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../../api/database.dart';
import '../../../../../api/entity/task/task.dart';
import '../../../../entity/status.dart';

part 'task_viewer_bloc.freezed.dart';
part 'task_viewer_event.dart';
part 'task_viewer_state.dart';

class TaskViewerBloc extends Bloc<TaskViewerEvent, TaskViewerState> {
  TaskViewerBloc(final int id, final Task? originalTask)
      : super(
          TaskViewerState(
            id: id,
            task: originalTask != null ? StatusOfData(data: originalTask) : const StatusOfLoading(),
          ),
        ) {
    on<TaskViewerEvent>((final event, final emit) {
      return switch (event) {
        TaskViewerEventLoadRequested() => _onLoadRequested(event, emit),
        TaskViewerEventDeleteDialogOpened() => _onDeleteDialogOpened(event, emit),
        TaskViewerEventDeleteDialogClosed() => _onDeleteDialogClosed(event, emit),
      };
    });

    _tasksSubscriptions = [
      db
          .channel('${Task.tableName}/$id')
          .onPostgresChanges(
            table: Task.tableName,
            event: PostgresChangeEvent.all,
            filter: PostgresChangeFilter(type: PostgresChangeFilterType.eq, column: $TaskImplJsonKeys.id, value: id),
            callback: (final _) => add(const TaskViewerEventLoadRequested()),
          )
          .subscribe(),
      db
          .channel('${Task.executivesTableName}/$id')
          .onPostgresChanges(
            table: Task.executivesTableName,
            event: PostgresChangeEvent.all,
            filter: PostgresChangeFilter(type: PostgresChangeFilterType.eq, column: $TaskImplJsonKeys.id, value: id),
            callback: (final _) => add(const TaskViewerEventLoadRequested()),
          )
          .subscribe(),
    ];

    if (state.task is StatusOfLoading) {
      add(const TaskViewerEventLoadRequested());
    }
  }

  late final List<RealtimeChannel> _tasksSubscriptions;

  Future<void> _onLoadRequested(final TaskViewerEvent event, final Emitter<TaskViewerState> emit) async {
    try {
      if (state.task is StatusOfError) {
        emit(state.copyWith(task: const StatusOfLoading()));
      }

      final task = await db.from(Task.tableName).select(Task.fieldNames).eq($TaskImplJsonKeys.id, state.id).maybeSingle().withConverter(Task.maybeFromJson);

      if (task == null) {
        emit(
          state.copyWith(
            task: const StatusOfError(
              error: 'Görev bulunamadı',
            ),
          ),
        );
        return;
      }

      emit(
        state.copyWith(
          task: StatusOfData(
            data: task,
          ),
        ),
      );
    } on Exception catch (e) {
      emit(
        state.copyWith(
          task: StatusOfError(
            error: e.toString(),
          ),
        ),
      );
    }
  }

  Future<void> _onDeleteDialogOpened(final TaskViewerEventDeleteDialogOpened event, final Emitter<TaskViewerState> emit) async {
    emit(
      state.copyWith(
        deleteState: const StatusInProgress(),
      ),
    );
  }

  Future<void> _onDeleteDialogClosed(final TaskViewerEventDeleteDialogClosed event, final Emitter<TaskViewerState> emit) async {
    if (event.isDeleted) {
      try {
        await db.from(Task.tableName).delete().eq($TaskImplJsonKeys.id, state.id);

        emit(
          state.copyWith(
            deleteState: const StatusCompleted(),
          ),
        );
      } on Exception catch (e) {
        emit(
          state.copyWith(
            deleteState: StatusError(error: e.toString()),
          ),
        );
      }
    } else {
      emit(
        state.copyWith(
          deleteState: const StatusInitial(),
        ),
      );
    }
  }

  @override
  Future<void> close() {
    for (var i = 0; i < _tasksSubscriptions.length; i++) {
      _tasksSubscriptions[i].unsubscribe();
    }
    return super.close();
  }
}
