import 'package:flutter/widgets.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../api/database.dart';
import '../../../../api/entity/task/task.dart';
import '../../extensions/snackbar.dart';

class Tasks extends ChangeNotifier {
  Tasks(this._context) {
    Future.microtask(_load);
  }

  final BuildContext _context;
  final scrollController = ScrollController();

  late final List<Task> tasks;
  late final RealtimeChannel? _tasksSubscription;

  bool _isLoading = true;
  bool get isLoading => _isLoading;
  set isLoading(final bool value) {
    if (_isLoading == value) return;

    _isLoading = value;
    notifyListeners();
  }

  Future<void> _load() async {
    try {
      tasks = await db.from(Task.tableName).select(Task.fieldNames).order('updated_at').withConverter(Task.converter) ?? List.empty();

      _tasksSubscription = db
          .channel(Task.tableName)
          .onPostgresChanges(
            table: Task.tableName,
            event: PostgresChangeEvent.all,
            callback: _onChangeTasks,
          )
          .subscribe();
    } on Exception catch (e) {
      tasks = List.empty();
      showSnackbar(text: e.toString(), context: _context);
    } finally {
      isLoading = false;
    }
  }

  void _onChangeTasks(final PostgresChangePayload payload) {
    switch (payload.eventType) {
      case PostgresChangeEvent.insert:
        final newTask = Task.fromJson(payload.newRecord);
        for (var i = 0; i < tasks.length; i++) {
          if (newTask.updatedAt.isAfter(tasks[i].updatedAt)) {
            tasks.insert(i, newTask);
            notifyListeners();
            return;
          }
        }
      case PostgresChangeEvent.update:
        final newTask = Task.fromJson(payload.newRecord);
        for (var i = 0; i < tasks.length; i++) {
          if (newTask.id == tasks[i].id) {
            tasks[i] = newTask;
            notifyListeners();
            return;
          }
        }
      case PostgresChangeEvent.delete:
        final int id = payload.oldRecord['id'];
        for (var i = 0; i < tasks.length; i++) {
          if (id == tasks[i].id) {
            tasks.removeAt(i);
            notifyListeners();
            return;
          }
        }
      default:
    }
  }

  @override
  void dispose() {
    _tasksSubscription?.unsubscribe();
    super.dispose();
  }
}
