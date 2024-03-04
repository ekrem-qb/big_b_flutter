import 'package:freezed_annotation/freezed_annotation.dart';

part 'task.freezed.dart';
part 'task.g.dart';

@freezed
class Task with _$Task {
  const factory Task({
    required final int id,
    required final String text,
    required final bool isDone,
    required final DateTime updatedAt,
    required final DateTime deadline,
    required final Duration delay,
    required final bool isImageRequired,
    final Uri? imageUrl,
  }) = _Task;

  factory Task.fromJson(final Map<String, dynamic> json) => _$TaskFromJson(json);

  static const tableName = 'tasks';

  static List<Task>? converter(final List<Map<String, dynamic>> data) => data.map(Task.fromJson).toList();
}
