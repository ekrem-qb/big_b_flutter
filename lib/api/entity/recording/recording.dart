import 'package:freezed_annotation/freezed_annotation.dart';

import '../../enums/processing.dart';
import '../entity.dart';
import '../join_table.dart';
import '../profile/profile.dart';

part 'recording.freezed.dart';
part 'recording.g.dart';

@Freezed(toJson: false)
class Recording with _$Recording implements Entity {
  const factory Recording({
    required final int id,
    @JsonKey(name: 'url') required final String audioUrl,
    required final Processing processed,
    required final DateTime createdAt,
    required final Profile employee,
  }) = _Recording;

  factory Recording.fromJson(final Map<String, dynamic> json) => _$RecordingFromJson(json);

  static const tableName = 'records';
  static final joinTables = [
    JoinTable(
      joinFieldName: $RecordingImplJsonKeys.employee,
      tableName: Profile.tableName,
      fieldNames: Profile.fieldNames,
    ),
  ];
  static final fieldNames = '${joinTables.join(',')},${_$$RecordingImplFieldMap.values.join(',')}';

  static List<Recording>? converter(final List<Map<String, dynamic>> data) => data.map(Recording.fromJson).toList();
}
