import 'package:freezed_annotation/freezed_annotation.dart';

import '../../enums/role.dart';
import '../entity.dart';
import '../join_table.dart';

part 'profile.freezed.dart';
part 'profile.g.dart';

@freezed
class Profile with _$Profile implements Entity {
  const factory Profile({
    @JsonKey(includeToJson: false) required final String uid,
    required final String name,
    @JsonKey(fromJson: _removeMail, includeToJson: false) required final String login,
    required final Role role,
    @JsonKey(includeToJson: false) required final DateTime createdAt,
    @Default(false) @JsonKey(includeToJson: false) final bool isDeleted,
  }) = _Profile;

  const Profile._();

  factory Profile.fromJson(final Map<String, dynamic> json) => _$ProfileFromJson(json);

  @override
  Object get id => uid;

  static const tableName = 'profiles';
  static const joinTables = <JoinTable>[];
  static final fieldNames = _$$ProfileImplFieldMap.values.join(',');

  static List<Profile>? converter(final List<Map<String, dynamic>> data) => data.map(Profile.fromJson).toList();
}

String _removeMail(final String email) {
  return email.split('@')[0];
}
