import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../api/database.dart';
import '../../../../api/entity/task/task.dart';
import '../../../app_router/app_router.dart';
import '../../extensions/snackbar.dart';

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
    _context.router.push(const PlannedTasksRoute());
  }

  void open(final int index) {
    if (tasks.length < index) return;

    _context.router.push(TaskViewerRoute(id: tasks[index].id, task: tasks[index]));
  }

  void newTask() {
    _context.pushRoute(const NewTaskEditorRoute());
  }

  @override
  void dispose() {
    for (var i = 0; i < _tasksSubscriptions.length; i++) {
      _tasksSubscriptions[i].unsubscribe();
    }
    super.dispose();
  }
}
