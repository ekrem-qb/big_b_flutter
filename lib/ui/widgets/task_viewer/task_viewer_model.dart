import 'dart:async';

import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../api/database.dart';
import '../../../api/entity/task/task.dart';
import '../delete_dialog.dart';
import '../extensions/snackbar.dart';
import '../task_editor/task_editor_page.dart';

class TaskViewer extends ChangeNotifier {
  TaskViewer(this._context, final Task originalTask) : _task = originalTask {
    _tasksSubscriptions = [
      db
          .channel('${Task.tableName}/${originalTask.id}')
          .onPostgresChanges(
            table: Task.tableName,
            event: PostgresChangeEvent.all,
            filter: PostgresChangeFilter(type: PostgresChangeFilterType.eq, column: $TaskImplJsonKeys.id, value: originalTask.id),
            callback: _load,
          )
          .subscribe(),
      db
          .channel('${Task.executivesTableName}/${originalTask.id}')
          .onPostgresChanges(
            table: Task.executivesTableName,
            event: PostgresChangeEvent.all,
            filter: PostgresChangeFilter(type: PostgresChangeFilterType.eq, column: $TaskImplJsonKeys.id, value: originalTask.id),
            callback: _load,
          )
          .subscribe(),
    ];
  }

  late final List<RealtimeChannel> _tasksSubscriptions;
  final BuildContext _context;

  Task? _task;
  Task? get task => _task;

  Future<void> _load([final _]) async {
    try {
      if (task == null) return;

      _task = await db.from(Task.tableName).select(Task.fieldNames).eq($TaskImplJsonKeys.id, task!.id).maybeSingle().withConverter(Task.maybeFromJson);
    } on Exception catch (e) {
      _task = null;
      showSnackbar(text: e.toString(), context: _context);
    } finally {
      notifyListeners();
    }
  }

  void edit() {
    Navigator.push(
      _context,
      MaterialPageRoute(
        builder: (final context) => TaskEditorPage(task: task),
      ),
    );
  }

  Future<void> delete() async {
    if (task == null) return;

    final delete = await showDeleteDialog(itemName: 'görevi', context: _context);
    if (!delete) return;

    try {
      await db.from(Task.tableName).delete().eq($TaskImplJsonKeys.id, task!.id);

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
