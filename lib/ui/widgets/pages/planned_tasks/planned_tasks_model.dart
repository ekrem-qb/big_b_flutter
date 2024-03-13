import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../api/database.dart';
import '../../../../api/entity/planned_task/planned_task.dart';
import '../../extensions/snackbar.dart';
import '../../task_editor/task_editor_widget.dart';

class PlannedTasks extends ChangeNotifier {
  PlannedTasks(this._context) {
    Future.microtask(_load);
  }

  final BuildContext _context;
  final scrollController = ScrollController();

  late final List<PlannedTask> plannedTasks;
  late final RealtimeChannel? _plannedTasksSubscription;

  bool _isLoading = true;
  bool get isLoading => _isLoading;
  set isLoading(final bool value) {
    if (_isLoading == value) return;

    _isLoading = value;
    notifyListeners();
  }

  Future<void> _load() async {
    try {
      plannedTasks = await db.from(PlannedTask.tableName).select(PlannedTask.fieldNames).order('updated_at').withConverter(PlannedTask.converter) ?? List.empty();

      _plannedTasksSubscription = db
          .channel(PlannedTask.tableName)
          .onPostgresChanges(
            table: PlannedTask.tableName,
            event: PostgresChangeEvent.all,
            callback: _onChangePlannedTasks,
          )
          .subscribe();
    } on Exception catch (e) {
      plannedTasks = List.empty();
      _plannedTasksSubscription = null;
      showSnackbar(text: e.toString(), context: _context);
    } finally {
      isLoading = false;
    }
  }

  void _onChangePlannedTasks(final PostgresChangePayload payload) {
    switch (payload.eventType) {
      case PostgresChangeEvent.insert:
        final newPlannedTask = PlannedTask.fromJson(payload.newRecord);
        for (var i = 0; i < plannedTasks.length; i++) {
          if (newPlannedTask.updatedAt.isAfter(plannedTasks[i].updatedAt)) {
            plannedTasks.insert(i, newPlannedTask);
            notifyListeners();
            return;
          }
        }
      case PostgresChangeEvent.update:
        final newPlannedTask = PlannedTask.fromJson(payload.newRecord);
        for (var i = 0; i < plannedTasks.length; i++) {
          if (newPlannedTask.id == plannedTasks[i].id) {
            plannedTasks[i] = newPlannedTask;
            notifyListeners();
            return;
          }
        }
      case PostgresChangeEvent.delete:
        final int id = payload.oldRecord['id'];
        for (var i = 0; i < plannedTasks.length; i++) {
          if (id == plannedTasks[i].id) {
            plannedTasks.removeAt(i);
            notifyListeners();
            return;
          }
        }
      default:
    }
  }

  void open(final int index) {
    if (plannedTasks.length < index) return;

    Navigator.push(
      _context,
      MaterialPageRoute(
        builder: (final context) => TaskEditorWidget(plannedTask: plannedTasks[index]),
      ),
    );
  }

  void newPlannedTask() {
    Navigator.push(
      _context,
      MaterialPageRoute(
        builder: (final context) => const TaskEditorWidget(),
      ),
    );
  }

  @override
  void dispose() {
    _plannedTasksSubscription?.unsubscribe();
    super.dispose();
  }
}
