import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../api/database.dart';
import '../../../../api/entity/planned_task/planned_task.dart';
import '../../../app_router/app_router.dart';
import '../../extensions/snackbar.dart';

class PlannedTasks extends ChangeNotifier {
  PlannedTasks(this._context) {
    _tasksSubscriptions = [
      db
          .channel(PlannedTask.tableName)
          .onPostgresChanges(
            table: PlannedTask.tableName,
            event: PostgresChangeEvent.all,
            callback: _load,
          )
          .subscribe(),
      db
          .channel(PlannedTask.executivesTableName)
          .onPostgresChanges(
            table: PlannedTask.executivesTableName,
            event: PostgresChangeEvent.all,
            callback: _load,
          )
          .subscribe(),
    ];
    Future.microtask(_load);
  }

  final BuildContext _context;

  late final List<RealtimeChannel> _tasksSubscriptions;
  late List<PlannedTask> plannedTasks;

  bool _isLoading = true;
  bool get isLoading => _isLoading;

  Future<void> _load([final _]) async {
    try {
      plannedTasks = await db.from(PlannedTask.tableName).select(PlannedTask.fieldNames).order($PlannedTaskImplJsonKeys.updatedAt).withConverter(PlannedTask.converter) ?? List.empty();
    } on Exception catch (e) {
      plannedTasks = List.empty();
      showSnackbar(text: e.toString(), context: _context);
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void open(final int index) {
    if (plannedTasks.length < index) return;

    _context.pushRoute(
      PlannedTaskEditorRoute(
        plannedTaskId: plannedTasks[index].id,
        plannedTask: plannedTasks[index],
      ),
    );
  }

  void newPlannedTask() {
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
