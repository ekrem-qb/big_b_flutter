import 'package:freezed_annotation/freezed_annotation.dart';

part 'recording.freezed.dart';
part 'recording.g.dart';

@Freezed(toJson: false)
class Recording with _$Recording {
  const factory Recording({
    required final int id,
    @JsonKey(name: 'url') required final Uri audioUrl,
    required final bool hasLines,
    required final DateTime createdAt,
  }) = _Recording;

  factory Recording.fromJson(final Map<String, dynamic> json) => _$RecordingFromJson(json);

  static const tableName = 'records';

  static List<Recording>? converter(final List<Map<String, dynamic>> data) => data.map(Recording.fromJson).toList();
}
