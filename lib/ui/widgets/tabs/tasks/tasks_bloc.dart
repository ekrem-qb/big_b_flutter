import '../../../../api/entity/join_table.dart';
import '../../../../api/entity/task/task.dart';
import '../../lister/bloc/lister_bloc.dart';

class TasksBloc extends ListerBloc<Task> {
  @override
  String tableName = Task.tableName;

  @override
  List<JoinTable> joinTables = Task.joinTables;

  @override
  String fieldNames = Task.fieldNames;

  @override
  String orderBy = $TaskImplJsonKeys.updatedAt;

  @override
  bool ascending = false;

  @override
  List<Task>? converter(final List<Map<String, Object?>> data) =>
      Task.converter(data);

  @override
  Task fromJson(final Map<String, Object?> json) => Task.fromJson(json);

  @override
  bool isAfter(final Task a, final Task b) => a.updatedAt.isAfter(b.updatedAt);

  @override
  bool isSame(final Map<String, Object?> a, final Task b) =>
      a[$TaskImplJsonKeys.id] == b.id;

  @override
  ListerFilters<Task>? filters;
}
