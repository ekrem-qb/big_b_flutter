import '../../../../api/entity/join_table.dart';
import '../../../../api/entity/recording/recording.dart';
import '../../lister/bloc/lister_bloc.dart';

class RecordingsBloc extends ListerBloc<Recording> {
  @override
  String tableName = Recording.tableName;

  @override
  List<JoinTable> joinTables = Recording.joinTables;

  @override
  String fieldNames = Recording.fieldNames;

  @override
  String orderBy = $RecordingImplJsonKeys.createdAt;

  @override
  bool ascending = false;

  @override
  List<Recording>? converter(final List<Map<String, Object?>> data) =>
      Recording.converter(data);

  @override
  Recording fromJson(final Map<String, Object?> json) =>
      Recording.fromJson(json);

  @override
  bool isAfter(final Recording a, final Recording b) =>
      a.createdAt.isAfter(b.createdAt);

  @override
  bool isSame(final Map<String, Object?> a, final Recording b) =>
      a[$RecordingImplJsonKeys.id] == b.id;

  @override
  ListerFilters<Recording>? filters;
}
