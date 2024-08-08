import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../api/database.dart';
import '../../../../api/entity/task/task.dart';
import '../../../app_router/app_router.dart';
import '../../extensions/snackbar.dart';
import '../delete_dialog.dart';

class TaskViewer extends ChangeNotifier {
  TaskViewer(this._context, this._id, final Task? originalTask) : _task = originalTask {
    if (originalTask == null) {
      _load();
    }
    _tasksSubscriptions = [
      db
          .channel('${Task.tableName}/$_id')
          .onPostgresChanges(
            table: Task.tableName,
            event: PostgresChangeEvent.all,
            filter: PostgresChangeFilter(type: PostgresChangeFilterType.eq, column: $TaskImplJsonKeys.id, value: _id),
            callback: _load,
          )
          .subscribe(),
      db
          .channel('${Task.executivesTableName}/$_id')
          .onPostgresChanges(
            table: Task.executivesTableName,
            event: PostgresChangeEvent.all,
            filter: PostgresChangeFilter(type: PostgresChangeFilterType.eq, column: $TaskImplJsonKeys.id, value: _id),
            callback: _load,
          )
          .subscribe(),
    ];
  }

  late final List<RealtimeChannel> _tasksSubscriptions;
  final BuildContext _context;
  final int _id;

  Task? _task;
  Task? get task => _task;

  Future<void> _load([final _]) async {
    try {
      _task = await db.from(Task.tableName).select(Task.fieldNames).eq($TaskImplJsonKeys.id, _id).maybeSingle().withConverter(Task.maybeFromJson);
    } on Exception catch (e) {
      _task = null;
      showSnackbar(text: e.toString(), context: _context);
    } finally {
      notifyListeners();
    }
  }

  void edit() {
    _context.pushRoute(TaskEditorRoute(taskId: _id, task: task));
  }

  Future<void> delete() async {
    if (task == null) return;

    final delete = await showDeleteDialog(itemName: 'görevi', context: _context);
    if (!delete) return;

    try {
      await db.from(Task.tableName).delete().eq($TaskImplJsonKeys.id, _id);

      Navigator.pop(_context);
    } on Exception catch (e) {
      showSnackbar(text: e.toString(), context: _context);
    }
  }

  @override
  void dispose() {
    for (var i = 0; i < _tasksSubscriptions.length; i++) {
      _tasksSubscriptions[i].unsubscribe();
    }
    super.dispose();
  }
}
