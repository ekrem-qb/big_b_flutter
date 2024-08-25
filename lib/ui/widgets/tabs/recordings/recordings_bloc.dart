import '../../../../api/entity/recording/recording.dart';
import '../../lister/bloc/lister_bloc.dart';

class RecordingsBloc extends ListerBloc<Recording> {
  @override
  String get tableName => Recording.tableName;

  @override
  String get fieldNames => Recording.fieldNames;

  @override
  String get orderBy => $RecordingImplJsonKeys.createdAt;

  @override
  bool get ascending => false;

  @override
  String get idFieldKey => $RecordingImplJsonKeys.id;

  @override
  List<Recording>? Function(List<Map<String, dynamic>> data) get converter => Recording.converter;

  @override
  Recording Function(Map<String, dynamic> json) get fromJson => Recording.fromJson;

  @override
  bool Function(Recording a, Recording b) get isAfter => (final a, final b) => a.createdAt.isAfter(b.createdAt);
}
