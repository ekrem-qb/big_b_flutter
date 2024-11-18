import '../../../../../api/entity/join_table.dart';
import '../../../../../api/entity/violation/violation.dart';
import '../../../lister/bloc/lister_bloc.dart';

class ViolationsBloc extends ListerBloc<Violation> {
  ViolationsBloc({
    this.recordingId,
    this.sortNewFirst = false,
    final List<Violation>? violations,
  }) : super(cachedItems: violations);

  final int? recordingId;
  final bool sortNewFirst;

  @override
  String get tableName => Violation.tableName;

  @override
  List<JoinTable> get joinTables => Violation.joinTables;

  @override
  String get fieldNames => Violation.fieldNames;

  @override
  String get orderBy => $NormalViolationImplJsonKeys.id;

  @override
  bool get ascending => sortNewFirst;

  @override
  String get idFieldKey => $NormalViolationImplJsonKeys.id;

  @override
  List<Violation>? Function(List<Map<String, dynamic>> data) get converter => Violation.converter;

  @override
  Violation Function(Map<String, dynamic> json) get fromJson => Violation.fromJson;

  @override
  bool Function(Violation a, Violation b) get isAfter => (final a, final b) => sortNewFirst ? a.id > b.id : a.id < b.id;

  @override
  ListerFilters<Violation>? get filters => recordingId != null
      ? (
          <T>(final query) => query.eq($NormalViolationImplJsonKeys.record, recordingId!),
          (final item) => item.record.id == recordingId,
        )
      : null;
}
