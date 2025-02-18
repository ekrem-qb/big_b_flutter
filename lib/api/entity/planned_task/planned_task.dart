import 'package:freezed_annotation/freezed_annotation.dart';

import '../entity.dart';
import '../join_table.dart';
import '../profile/profile.dart';

part 'planned_task.freezed.dart';
part 'planned_task.g.dart';

@freezed
class PlannedTask with _$PlannedTask implements Entity {
  const factory PlannedTask({
    @JsonKey(includeToJson: false) required final int id,
    required final String text,
    required final DateTime deadline,
    required final bool isImageRequired,
    required final DateTime updatedAt,
    required final int weekdays,
    // ignore: always_put_required_named_parameters_first
    @JsonKey(includeToJson: false) required final List<Profile> executives,
  }) = _PlannedTask;

  factory PlannedTask.fromJson(final Map<String, Object?> json) =>
      _$PlannedTaskFromJson(json);

  static const tableName = 'planned_tasks';
  static const executivesTableName =
      '${tableName}_${$PlannedTaskImplJsonKeys.executives}';
  static final joinTables = [
    JoinTable(
      joinFieldName: $PlannedTaskImplJsonKeys.executives,
      tableName: '${Profile.tableName}!$executivesTableName',
      fieldNames: Profile.fieldNames,
    ),
  ];
  static final fieldNames =
      '${joinTables.join(',')},${_$$PlannedTaskImplFieldMap.values.toSet().difference(joinTables.map((final e) => e.joinFieldName).toSet()).join(',')}';

  static List<PlannedTask>? converter(final List<Map<String, Object?>> data) =>
      data.map(PlannedTask.fromJson).toList();
}
