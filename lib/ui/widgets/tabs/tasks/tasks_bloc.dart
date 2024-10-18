import 'package:bloc/bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../api/database.dart';
import '../../../../api/entity/task/task.dart';
import '../../../entity/status.dart';
import '../../lister/bloc/lister_bloc.dart';

class TasksBloc extends ListerBloc<Task> {
  TasksBloc() : super() {
    _executivesSubscription = db
        .channel(Task.executivesTableName)
        .onPostgresChanges(
          table: Task.executivesTableName,
          event: PostgresChangeEvent.all,
          callback: (final _) => add(const ListerEventLoadRequested()),
        )
        .subscribe();
  }

  RealtimeChannel? _executivesSubscription;

  @override
  String get tableName => Task.tableName;

  @override
  String get fieldNames => Task.fieldNames;

  @override
  String get orderBy => $TaskImplJsonKeys.updatedAt;

  @override
  bool get ascending => false;

  @override
  String get idFieldKey => $TaskImplJsonKeys.id;

  @override
  List<Task>? Function(List<Map<String, dynamic>> data) get converter => Task.converter;

  @override
  Task Function(Map<String, dynamic> json) get fromJson => Task.fromJson;

  @override
  bool Function(Task a, Task b) get isAfter => (final a, final b) => a.updatedAt.isAfter(b.updatedAt);

  @override
  Future<void> onDataUpdated(final Emitter<StatusOf<ListerState>> emit, final ListerEventDataUpdated event) async {
    add(const ListerEventLoadRequested());
  }

  @override
  Future<void> close() {
    _executivesSubscription?.unsubscribe();
    return super.close();
  }
}
