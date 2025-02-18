import '../../../../api/entity/join_table.dart';
import '../../../../api/entity/profile/profile.dart';
import '../../lister/bloc/lister_bloc.dart';

class ProfilesBloc extends ListerBloc<Profile> {
  @override
  String get tableName => Profile.tableName;

  @override
  List<JoinTable> get joinTables => Profile.joinTables;

  @override
  String get fieldNames => Profile.fieldNames;

  @override
  String get orderBy => $ProfileImplJsonKeys.createdAt;

  @override
  bool get ascending => false;

  @override
  String get idFieldKey => $ProfileImplJsonKeys.uid;

  @override
  List<Profile>? Function(List<Map<String, Object?>> data) get converter =>
      Profile.converter;

  @override
  Profile Function(Map<String, Object?> json) get fromJson => Profile.fromJson;

  @override
  bool Function(Profile a, Profile b) get isAfter =>
      (final a, final b) => a.createdAt.isAfter(b.createdAt);

  @override
  ListerFilters<Profile>? get filters => null;
}
