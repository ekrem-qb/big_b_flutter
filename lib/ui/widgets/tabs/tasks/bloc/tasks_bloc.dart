import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../../api/database.dart';
import '../../../../../api/entity/task/task.dart';

part 'tasks_bloc.freezed.dart';
part 'tasks_event.dart';
part 'tasks_state.dart';

class TasksBloc extends Bloc<TasksEvent, TasksState> {
  TasksBloc() : super(const TasksStateLoading()) {
    on<TasksEvent>((final event, final emit) {
      return switch (event) {
        TasksEventLoadRequested() => _onLoadRequested(emit, event),
      };
    });

    _tasksSubscriptions = [
      db
          .channel(Task.tableName)
          .onPostgresChanges(
            table: Task.tableName,
            event: PostgresChangeEvent.all,
            callback: (final _) => add(const TasksEventLoadRequested()),
          )
          .subscribe(),
      db
          .channel(Task.executivesTableName)
          .onPostgresChanges(
            table: Task.executivesTableName,
            event: PostgresChangeEvent.all,
            callback: (final _) => add(const TasksEventLoadRequested()),
          )
          .subscribe(),
    ];

    add(const TasksEventLoadRequested());
  }

  late final List<RealtimeChannel> _tasksSubscriptions;

  Future<void> _onLoadRequested(final Emitter<TasksState> emit, final TasksEventLoadRequested event) async {
    try {
      if (state is TasksStateError) {
        emit(const TasksStateLoading());
      }

      final tasks = await db.from(Task.tableName).select(Task.fieldNames).order($TaskImplJsonKeys.updatedAt).withConverter(Task.converter) ?? List.empty();
      emit(TasksStateData(tasks: tasks));
    } on Exception catch (e) {
      emit(TasksStateError(error: e.toString()));
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
