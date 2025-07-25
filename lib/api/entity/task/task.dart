import 'package:freezed_annotation/freezed_annotation.dart';

import '../join_table.dart';
import '../profile/profile.dart';

part 'task.freezed.dart';
part 'task.g.dart';

@freezed
class Task with _$Task {
  const factory Task({
    @JsonKey(includeToJson: false) required final int id,
    required final String text,
    required final bool isDone,
    required final DateTime updatedAt,
    required final DateTime deadline,
    required final Duration delay,
    required final bool isImageRequired,
    final Uri? imageUrl,
    // ignore: always_put_required_named_parameters_first
    @JsonKey(includeToJson: false) required final List<Profile> executives,
  }) = _Task;

  factory Task.fromJson(final Map<String, Object?> json) =>
      _$TaskFromJson(json);

  static Task? maybeFromJson(final Map<String, Object?>? json) =>
      json != null ? _$TaskFromJson(json) : null;

  static const tableName = 'tasks';
  static const executivesTableName =
      '${tableName}_${$TaskImplJsonKeys.executives}';
  static final joinTables = [
    JoinTable(
      joinFieldName: $TaskImplJsonKeys.executives,
      tableName: '${Profile.tableName}!$executivesTableName',
      fieldNames: Profile.fieldNames,
    ),
  ];
  static final fieldNames =
      '${joinTables.join(',')},${_$$TaskImplFieldMap.values.toSet().difference(joinTables.map((final e) => e.joinFieldName).toSet()).join(',')}';

  static List<Task>? converter(final List<Map<String, Object?>> data) =>
      data.map(Task.fromJson).toList(growable: false);
}
