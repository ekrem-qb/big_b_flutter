import '../../../../api/entity/join_table.dart';
import '../../../../api/entity/planned_task/planned_task.dart';
import '../../lister/bloc/lister_bloc.dart';

class PlannedTasksBloc extends ListerBloc<PlannedTask> {
  @override
  String tableName = PlannedTask.tableName;

  @override
  List<JoinTable> joinTables = PlannedTask.joinTables;

  @override
  String fieldNames = PlannedTask.fieldNames;

  @override
  String orderBy = $PlannedTaskImplJsonKeys.updatedAt;

  @override
  bool ascending = false;

  @override
  List<PlannedTask>? converter(final List<Map<String, Object?>> data) =>
      PlannedTask.converter(data);

  @override
  PlannedTask fromJson(final Map<String, Object?> json) =>
      PlannedTask.fromJson(json);

  @override
  bool isAfter(final PlannedTask a, final PlannedTask b) =>
      a.updatedAt.isAfter(b.updatedAt);

  @override
  bool isSame(final Map<String, Object?> a, final PlannedTask b) =>
      a[$PlannedTaskImplJsonKeys.id] == b.id;

  @override
  ListerFilters<PlannedTask>? filters;
}
