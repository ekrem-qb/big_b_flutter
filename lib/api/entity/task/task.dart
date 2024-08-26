import 'package:freezed_annotation/freezed_annotation.dart';

import '../entity.dart';
import '../profile/profile.dart';

part 'task.freezed.dart';
part 'task.g.dart';

@freezed
class Task with _$Task implements Entity {
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

  factory Task.fromJson(final Map<String, dynamic> json) => _$TaskFromJson(json);

  static Task? maybeFromJson(final Map<String, dynamic>? json) => json != null ? _$TaskFromJson(json) : null;

  static const tableName = 'tasks';
  static const executivesTableName = '${tableName}_${$TaskImplJsonKeys.executives}';
  static final fieldNames = '${_$$TaskImplFieldMap.values.join(',')}:${Profile.tableName}!$executivesTableName(${Profile.fieldNames})';

  static List<Task>? converter(final List<Map<String, dynamic>> data) => data.map(Task.fromJson).toList();
}
