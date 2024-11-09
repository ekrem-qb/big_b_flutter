import 'package:bloc/bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../api/database.dart';
import '../../../../api/entity/planned_task/planned_task.dart';
import '../../../entity/status.dart';
import '../../lister/bloc/lister_bloc.dart';

class PlannedTasksBloc extends ListerBloc<PlannedTask> {
  PlannedTasksBloc() : super() {
    _executivesSubscription = db
        .channel(PlannedTask.executivesTableName)
        .onPostgresChanges(
          table: PlannedTask.executivesTableName,
          event: PostgresChangeEvent.all,
          callback: (final _) => add(const ListerEventLoadRequested()),
        )
        .subscribe();
  }

  RealtimeChannel? _executivesSubscription;

  @override
  String get tableName => PlannedTask.tableName;

  @override
  String get fieldNames => PlannedTask.fieldNames;

  @override
  String get orderBy => $PlannedTaskImplJsonKeys.updatedAt;

  @override
  bool get ascending => false;

  @override
  String get idFieldKey => $PlannedTaskImplJsonKeys.id;

  @override
  List<PlannedTask>? Function(List<Map<String, dynamic>> data) get converter => PlannedTask.converter;

  @override
  PlannedTask Function(Map<String, dynamic> json) get fromJson => PlannedTask.fromJson;

  @override
  bool Function(PlannedTask a, PlannedTask b) get isAfter => (final a, final b) => a.updatedAt.isAfter(b.updatedAt);

  @override
  Future<void> onDataUpdated(final Emitter<StatusOf<ListerState<PlannedTask>>> emit, final ListerEventDataUpdated event) async {
    add(const ListerEventLoadRequested());
  }

  @override
  Future<void> close() {
    _executivesSubscription?.unsubscribe();
    return super.close();
  }
}
