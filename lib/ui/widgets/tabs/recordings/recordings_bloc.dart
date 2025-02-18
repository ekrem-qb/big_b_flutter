import '../../../../api/entity/join_table.dart';
import '../../../../api/entity/recording/recording.dart';
import '../../lister/bloc/lister_bloc.dart';

class RecordingsBloc extends ListerBloc<Recording> {
  @override
  String get tableName => Recording.tableName;

  @override
  List<JoinTable> get joinTables => Recording.joinTables;

  @override
  String get fieldNames => Recording.fieldNames;

  @override
  String get orderBy => $RecordingImplJsonKeys.createdAt;

  @override
  bool get ascending => false;

  @override
  List<Recording>? Function(List<Map<String, Object?>> data) get converter =>
      Recording.converter;

  @override
  Recording Function(Map<String, Object?> json) get fromJson =>
      Recording.fromJson;

  @override
  bool Function(Recording a, Recording b) get isAfter =>
      (final a, final b) => a.createdAt.isAfter(b.createdAt);

  @override
  bool Function(Map<String, Object?> a, Recording b) get isSame =>
      (final a, final b) => a[$RecordingImplJsonKeys.id] == b.id;

  @override
  ListerFilters<Recording>? get filters => null;
}
