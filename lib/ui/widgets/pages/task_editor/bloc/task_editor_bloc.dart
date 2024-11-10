import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../api/database.dart';
import '../../../../../api/entity/planned_task/planned_task.dart';
import '../../../../../api/entity/profile/profile.dart';
import '../../../../../api/entity/profile_join/profile_join.dart';
import '../../../../../api/entity/task/task.dart';
import '../../../../../extensions/date_time.dart';
import '../../../../../extensions/weekdays.dart';
import '../../../../entity/status.dart';

part 'task_editor_bloc.freezed.dart';
part 'task_editor_event.dart';
part 'task_editor_state.dart';

class TaskEditorBloc extends Bloc<TaskEditorEvent, TaskEditorState> {
  TaskEditorBloc({
    final int? plannedTaskId,
    final int? taskId,
    final PlannedTask? originalPlannedTask,
    final Task? originalTask,
  }) : super(
          TaskEditorState(
            isNew: plannedTaskId == null && taskId == null,
            id: plannedTaskId ?? taskId ?? -1,
            loadingState: (originalPlannedTask == null && plannedTaskId != null) || (originalTask == null && taskId != null) ? const StatusLoading() : const StatusCompleted(),
            isPlanned: plannedTaskId != null,
            isRepeated: (originalPlannedTask?.weekdays ?? 0) > 0,
            text: originalPlannedTask?.text ?? originalTask?.text ?? '',
            textError: null,
            time: originalPlannedTask?.deadline.toTime() ?? originalTask?.deadline.toTime() ?? DateTime.now().toTime(),
            date: originalPlannedTask?.deadline ?? originalTask?.deadline ?? DateTime.now(),
            isImageRequired: originalPlannedTask?.isImageRequired ?? originalTask?.isImageRequired ?? false,
            weekdays: originalPlannedTask?.weekdays ?? 0,
            executives: originalPlannedTask?.executives.toList() ?? originalTask?.executives.toList() ?? [],
            uploadState: const OperationStatusInitial(),
            deleteState: const OperationStatusInitial(),
          ),
        ) {
    on<TaskEditorEvent>((final event, final emit) async {
      return switch (event) {
        TaskEditorEventLoadRequested() => _onLoadRequested(event, emit),
        TaskEditorEventTextChanged() => _onTextChanged(event, emit),
        TaskEditorEventIsImageRequiredChanged() => _onIsImageRequiredToggled(event, emit),
        TaskEditorEventTimeChanged() => _onTimeChanged(event, emit),
        TaskEditorEventDateChanged() => _onDateChanged(event, emit),
        TaskEditorEventWeekdayToggled() => _onWeekdayToggled(event, emit),
        TaskEditorEventExecutivesAdded() => _onExecutivesAdded(event, emit),
        TaskEditorEventExecutiveRemoved() => _onExecutiveRemoved(event, emit),
        TaskEditorEventSaveRequested() => _onSaveRequested(event, emit),
        TaskEditorEventDeleteRequested() => _onDeleteRequested(event, emit),
      };
    });

    if (state.loadingState case StatusLoading()) {
      add(const TaskEditorEventLoadRequested());
    }
  }

  Future<void> _onLoadRequested(final TaskEditorEventLoadRequested event, final Emitter<TaskEditorState> emit) async {
    if (state.isNew) return;

    emit(
      state.copyWith(
        loadingState: const StatusLoading(),
      ),
    );

    try {
      if (state.isPlanned) {
        final plannedTask = await db.from(PlannedTask.tableName).select(PlannedTask.fieldNames).eq($PlannedTaskImplJsonKeys.id, state.id).single().withConverter(PlannedTask.fromJson);

        emit(
          state.copyWith(
            loadingState: const StatusCompleted(),
            text: plannedTask.text,
            textError: null,
            time: plannedTask.deadline.toTime(),
            isImageRequired: plannedTask.isImageRequired,
            weekdays: plannedTask.weekdays,
            executives: plannedTask.executives,
            uploadState: const OperationStatusInitial(),
          ),
        );
      } else {
        final task = await db.from(Task.tableName).select(Task.fieldNames).eq($TaskImplJsonKeys.id, state.id).single().withConverter(Task.fromJson);

        emit(
          state.copyWith(
            loadingState: const StatusCompleted(),
            text: task.text,
            textError: null,
            time: task.deadline.toTime(),
            date: task.deadline,
            isImageRequired: task.isImageRequired,
            weekdays: 0,
            executives: task.executives,
            uploadState: const OperationStatusInitial(),
          ),
        );
      }
    } catch (e) {
      emit(
        state.copyWith(
          loadingState: StatusError(e.toString()),
        ),
      );
    }
  }

  Future<void> _onTextChanged(final TaskEditorEventTextChanged event, final Emitter<TaskEditorState> emit) async {
    emit(
      state.copyWith(
        text: event.text,
        textError: null,
      ),
    );
  }

  Future<void> _onIsImageRequiredToggled(final TaskEditorEventIsImageRequiredChanged event, final Emitter<TaskEditorState> emit) async {
    emit(
      state.copyWith(
        isImageRequired: event.value,
      ),
    );
  }

  Future<void> _onTimeChanged(final TaskEditorEventTimeChanged event, final Emitter<TaskEditorState> emit) async {
    emit(
      state.copyWith(
        time: event.time,
      ),
    );
  }

  Future<void> _onDateChanged(final TaskEditorEventDateChanged event, final Emitter<TaskEditorState> emit) async {
    emit(
      state.copyWith(
        date: event.date,
      ),
    );
  }

  Future<void> _onWeekdayToggled(final TaskEditorEventWeekdayToggled event, final Emitter<TaskEditorState> emit) async {
    if (isWeekdaySelected(event.day, state.weekdays) == event.value) return;

    final weekdays = event.value ? state.weekdays | 1 << event.day : state.weekdays & ~(1 << event.day);

    emit(
      state.copyWith(
        weekdays: weekdays,
        isRepeated: weekdays > 0,
      ),
    );
  }

  Future<void> _onExecutivesAdded(final TaskEditorEventExecutivesAdded event, final Emitter<TaskEditorState> emit) async {
    emit(
      state.copyWith(
        executives: [
          ...state.executives,
          ...event.executives,
        ],
      ),
    );
  }

  Future<void> _onExecutiveRemoved(final TaskEditorEventExecutiveRemoved event, final Emitter<TaskEditorState> emit) async {
    emit(
      state.copyWith(
        executives: [
          ...state.executives.sublist(0, event.index),
          ...state.executives.sublist(event.index + 1),
        ],
      ),
    );
  }

  Future<void> _onSaveRequested(final TaskEditorEventSaveRequested event, final Emitter<TaskEditorState> emit) async {
    final trimmedText = state.text.trim();
    final isEmpty = trimmedText.isEmpty;

    emit(
      state.copyWith(
        text: trimmedText,
        textError: isEmpty ? 'Açıklama alanını doldurunuz' : null,
      ),
    );

    if (isEmpty) return;

    emit(
      state.copyWith(
        uploadState: const OperationStatusInProgress(),
      ),
    );

    if (await _upload(emit: emit)) {
      emit(
        state.copyWith(
          uploadState: const OperationStatusCompleted(),
        ),
      );
    } else {
      emit(
        state.copyWith(
          uploadState: const OperationStatusInitial(),
        ),
      );
    }
  }

  Future<bool> _upload({required final Emitter<TaskEditorState> emit}) async {
    final currentState = state;

    try {
      final now = DateTime.now();
      final isToday = isWeekdaySelected(now.weekday - 1, state.weekdays);
      final deadline = (isToday ? now : state.date).copyWithTime(state.time);

      final task = Task(
        id: state.id,
        text: state.text,
        isDone: false,
        updatedAt: now,
        deadline: deadline,
        delay: Duration.zero,
        isImageRequired: state.isImageRequired,
        executives: state.executives,
      );

      if (state.isRepeated || state.isPlanned) {
        final plannedTask = PlannedTask(
          id: state.id,
          text: state.text,
          deadline: deadline,
          isImageRequired: state.isImageRequired,
          updatedAt: now,
          weekdays: state.weekdays,
          executives: state.executives,
        );

        final int? id;

        if (state.isNew) {
          final addedPlannedTasks = await db.from(PlannedTask.tableName).insert(plannedTask.toJson()).select(PlannedTask.fieldNames).withConverter(PlannedTask.converter);

          id = addedPlannedTasks?.firstOrNull?.id;
          if (id == null) return false;
        } else {
          id = state.id;

          await db.from(PlannedTask.tableName).update(plannedTask.toJson()).eq($PlannedTaskImplJsonKeys.id, plannedTask.id);

          await db.from(PlannedTask.executivesTableName).delete().eq($ProfileJoinImplJsonKeys.id, plannedTask.id);
        }

        final executivesJoins = state.executives.map((final Profile profile) => ProfileJoin(id: id!, profile: profile.uid).toJson()).toList();

        await db.from(PlannedTask.executivesTableName).upsert(executivesJoins);

        if (isToday && state.isNew) {
          if (!await _uploadTask(task)) {
            return false;
          }
        }
      } else {
        if (!await _uploadTask(task)) {
          return false;
        }
      }
      return true;
    } catch (e) {
      emit(
        currentState.copyWith(
          uploadState: OperationStatusError(
            e.toString(),
          ),
        ),
      );
      return false;
    }
  }

  Future<bool> _uploadTask(final Task task) async {
    final int? id;

    if (state.isNew) {
      final addedTasks = await db.from(Task.tableName).insert(task.toJson()).select(Task.fieldNames).withConverter(Task.converter);

      id = addedTasks?.firstOrNull?.id;
      if (id == null) return false;
    } else {
      await db.from(Task.tableName).update(task.toJson()).eq($TaskImplJsonKeys.id, task.id);

      await db.from(Task.executivesTableName).delete().eq($ProfileJoinImplJsonKeys.id, task.id);

      id = state.id;
    }

    final newExecutives = state.executives.map((final Profile profile) => ProfileJoin(id: id!, profile: profile.uid).toJson()).toList();

    await db.from(Task.executivesTableName).upsert(newExecutives);

    return true;
  }

  Future<void> _onDeleteRequested(final TaskEditorEventDeleteRequested event, final Emitter<TaskEditorState> emit) async {
    emit(
      state.copyWith(
        deleteState: const OperationStatusInProgress(),
      ),
    );

    try {
      await db.from(state.isPlanned ? PlannedTask.tableName : Task.tableName).delete().eq($TaskImplJsonKeys.id, state.id);

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
}
