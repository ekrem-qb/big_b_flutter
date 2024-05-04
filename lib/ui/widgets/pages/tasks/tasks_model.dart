import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../api/database.dart';
import '../../../../api/entity/task/task.dart';
import '../../extensions/snackbar.dart';
import '../../task_editor/task_editor_widget.dart';
import '../../task_window/task_window_widget.dart';
import '../planned_tasks/planned_tasks_widget.dart';

class Tasks extends ChangeNotifier {
  Tasks(this._context) {
    _tasksSubscriptions = [
      db
          .channel(Task.tableName)
          .onPostgresChanges(
            table: Task.tableName,
            event: PostgresChangeEvent.all,
            callback: _load,
          )
          .subscribe(),
      db
          .channel(Task.executivesTableName)
          .onPostgresChanges(
            table: Task.executivesTableName,
            event: PostgresChangeEvent.all,
            callback: _load,
          )
          .subscribe(),
    ];
    Future.microtask(_load);
  }

  final BuildContext _context;
  final scrollController = ScrollController();

  late final List<RealtimeChannel> _tasksSubscriptions;
  late List<Task> tasks;

  bool _isLoading = true;
  bool get isLoading => _isLoading;

  Future<void> _load([final _]) async {
    try {
      tasks = await db.from(Task.tableName).select(Task.fieldNames).order($TaskImplJsonKeys.updatedAt).withConverter(Task.converter) ?? List.empty();
    } on Exception catch (e) {
      tasks = List.empty();
      _tasksSubscriptions = List.empty();
      showSnackbar(text: e.toString(), context: _context);
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void openPlanning() {
    Navigator.push(
      _context,
      MaterialPageRoute(
        builder: (final context) => const PlannedTasksWidget(),
      ),
    );
  }

  void open(final int index) {
    if (tasks.length < index) return;

    showCupertinoDialog(
      context: _context,
      barrierDismissible: true,
      builder: (final context) => TaskWindowWidget(task: tasks[index]),
    );
  }

  void newTask() {
    Navigator.push(
      _context,
      MaterialPageRoute(
        builder: (final context) => const TaskEditorWidget(),
      ),
    );
  }

  @override
  void dispose() {
    for (var i = 0; i < _tasksSubscriptions.length; i++) {
      _tasksSubscriptions[i].unsubscribe();
    }
    super.dispose();
  }
}
