import '../../../../api/entity/join_table.dart';
import '../../../../api/entity/planned_task/planned_task.dart';
import '../../lister/bloc/lister_bloc.dart';

class PlannedTasksBloc extends ListerBloc<PlannedTask> {
  @override
  String get tableName => PlannedTask.tableName;

  @override
  List<JoinTable> get joinTables => PlannedTask.joinTables;

  @override
  String get fieldNames => PlannedTask.fieldNames;

  @override
  String get orderBy => $PlannedTaskImplJsonKeys.updatedAt;

  @override
  bool get ascending => false;

  @override
  String get idFieldKey => $PlannedTaskImplJsonKeys.id;

  @override
  List<PlannedTask>? Function(List<Map<String, Object?>> data) get converter =>
      PlannedTask.converter;

  @override
  PlannedTask Function(Map<String, Object?> json) get fromJson =>
      PlannedTask.fromJson;

  @override
  bool Function(PlannedTask a, PlannedTask b) get isAfter =>
      (final a, final b) => a.updatedAt.isAfter(b.updatedAt);

  @override
  ListerFilters<PlannedTask>? get filters => null;
}
