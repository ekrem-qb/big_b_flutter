import '../../../../api/entity/join_table.dart';
import '../../../../api/entity/profile/profile.dart';
import '../../lister/bloc/lister_bloc.dart';

class ProfilesBloc extends ListerBloc<Profile> {
  @override
  String tableName = Profile.tableName;

  @override
  List<JoinTable> joinTables = Profile.joinTables;

  @override
  String fieldNames = Profile.fieldNames;

  @override
  String orderBy = $ProfileImplJsonKeys.createdAt;

  @override
  bool ascending = false;

  @override
  List<Profile>? converter(final List<Map<String, Object?>> data) =>
      Profile.converter(data);

  @override
  Profile fromJson(final Map<String, Object?> json) => Profile.fromJson(json);

  @override
  bool isAfter(final Profile a, final Profile b) =>
      a.createdAt.isAfter(b.createdAt);

  @override
  bool isSame(final Map<String, Object?> a, final Profile b) =>
      a[$ProfileImplJsonKeys.uid] == b.uid;

  @override
  ListerFilters<Profile>? filters;
}
