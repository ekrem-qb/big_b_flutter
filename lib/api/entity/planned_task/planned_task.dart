import 'package:freezed_annotation/freezed_annotation.dart';

import '../task/task.dart';

part 'planned_task.freezed.dart';
part 'planned_task.g.dart';

@freezed
class PlannedTask with _$PlannedTask {
  const factory PlannedTask({
    @JsonKey(defaultValue: -1, includeToJson: false) required final int id,
    required final Task task,
    required final Duration time,
    required final DateTime updatedAt,
    required final int weekdays,
  }) = _PlannedTask;

  factory PlannedTask.fromJson(final Map<String, dynamic> json) => _$PlannedTaskFromJson(json);

  static const tableName = 'planned_tasks';
  static final fieldNames = 'id,${_$$PlannedTaskImplFieldMap.values.join(',')}';

  static List<PlannedTask>? converter(final List<Map<String, dynamic>> data) => data.map(PlannedTask.fromJson).toList();
}
