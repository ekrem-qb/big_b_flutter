import 'package:freezed_annotation/freezed_annotation.dart';

import '../entity.dart';
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

  factory PlannedTask.fromJson(final Map<String, dynamic> json) => _$PlannedTaskFromJson(json);

  static const tableName = 'planned_tasks';
  static const executivesTableName = '${tableName}_${$PlannedTaskImplJsonKeys.executives}';
  static final fieldNames = '${_$$PlannedTaskImplFieldMap.values.join(',')}:${Profile.tableName}!$executivesTableName(${Profile.fieldNames})';

  static List<PlannedTask>? converter(final List<Map<String, dynamic>> data) => data.map(PlannedTask.fromJson).toList();
}
