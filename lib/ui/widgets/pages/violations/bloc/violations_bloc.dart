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
  String tableName = Violation.tableName;

  @override
  List<JoinTable> joinTables = Violation.joinTables;

  @override
  String fieldNames = Violation.fieldNames;

  @override
  String orderBy = $NormalViolationImplJsonKeys.id;

  @override
  bool get ascending => sortNewFirst;

  @override
  List<Violation>? converter(final List<Map<String, Object?>> data) =>
      Violation.converter(data);

  @override
  Violation fromJson(final Map<String, Object?> json) =>
      Violation.fromJson(json);

  @override
  bool isAfter(final Violation a, final Violation b) =>
      sortNewFirst ? a.id > b.id : a.id < b.id;

  @override
  bool isSame(final Map<String, Object?> a, final Violation b) =>
      a[$NormalViolationImplJsonKeys.id] == b.id;

  @override
  ListerFilters<Violation>? get filters =>
      recordingId != null
          ? (
            <T>(final query) =>
                query.eq($NormalViolationImplJsonKeys.record, recordingId!),
            (final item) => item.record.id == recordingId,
          )
          : null;
}
