import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_join.freezed.dart';
part 'profile_join.g.dart';

@freezed
class ProfileJoin with _$ProfileJoin {
  const factory ProfileJoin({
    required final int id,
    required final String profile,
  }) = _ProfileJoin;

  factory ProfileJoin.fromJson(final Map<String, dynamic> json) => _$ProfileJoinFromJson(json);
}
