import 'dart:async';

import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../api/database.dart';
import '../../../api/entity/task/task.dart';
import '../delete_dialog.dart';
import '../extensions/snackbar.dart';
import '../task_editor/task_editor_widget.dart';

class TaskWindow extends ChangeNotifier {
  TaskWindow(this._context, this._task) {
    Future.microtask(_load);
  }

  final BuildContext _context;
  late final RealtimeChannel? _subscription;

  bool _isDeleted = false;
  bool get isDeleted => _isDeleted;
  set isDeleted(final bool value) {
    if (_isDeleted == value) return;

    _isDeleted = value;
    notifyListeners();
  }

  Task _task;
  Task get task => _task;

  Future<void> _load() async {
    try {
      _subscription = db
          .channel('${Task.tableName}/${_task.id}')
          .onPostgresChanges(
            table: Task.tableName,
            event: PostgresChangeEvent.all,
            callback: _onTaskUpdate,
            filter: PostgresChangeFilter(type: PostgresChangeFilterType.eq, column: 'id', value: _task.id),
          )
          .subscribe();
    } on Exception catch (e) {
      isDeleted = true;
      _subscription = null;
      showSnackbar(text: e.toString(), context: _context);
    }
  }

  void _onTaskUpdate(final PostgresChangePayload payload) {
    try {
      switch (payload.eventType) {
        case PostgresChangeEvent.insert:
        case PostgresChangeEvent.update:
          final newTask = Task.fromJson(payload.newRecord);

          isDeleted = false;
          if (_task == newTask) return;

          _task = newTask;
          notifyListeners();
        case PostgresChangeEvent.delete:
          isDeleted = true;
        default:
      }
    } on Exception catch (e) {
      isDeleted = true;
      showSnackbar(text: e.toString(), context: _context);
    }
  }

  void edit() {
    Navigator.push(
      _context,
      MaterialPageRoute(
        builder: (final context) => TaskEditorWidget(task: task),
      ),
    );
  }

  Future<void> delete() async {
    final delete = await showDeleteDialog(itemName: 'görevi', context: _context);

    if (delete) {
      try {
        await db.from(Task.tableName).delete().eq('id', task.id);

        Navigator.pop(_context);
      } on Exception catch (e) {
        showSnackbar(text: e.toString(), context: _context);
      }
    }
  }

  @override
  void dispose() {
    _subscription?.unsubscribe();
    super.dispose();
  }
}
