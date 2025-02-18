import '../../../../api/entity/join_table.dart';
import '../../../../api/entity/task/task.dart';
import '../../lister/bloc/lister_bloc.dart';

class TasksBloc extends ListerBloc<Task> {
  @override
  String get tableName => Task.tableName;

  @override
  List<JoinTable> get joinTables => Task.joinTables;

  @override
  String get fieldNames => Task.fieldNames;

  @override
  String get orderBy => $TaskImplJsonKeys.updatedAt;

  @override
  bool get ascending => false;

  @override
  List<Task>? Function(List<Map<String, Object?>> data) get converter =>
      Task.converter;

  @override
  Task Function(Map<String, Object?> json) get fromJson => Task.fromJson;

  @override
  bool Function(Task a, Task b) get isAfter =>
      (final a, final b) => a.updatedAt.isAfter(b.updatedAt);

  @override
  bool Function(Map<String, Object?> a, Task b) get isSame =>
      (final a, final b) => a[$TaskImplJsonKeys.id] == b.id;

  @override
  ListerFilters<Task>? get filters => null;
}
