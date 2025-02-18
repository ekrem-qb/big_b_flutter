import '../../../../api/entity/join_table.dart';
import '../../../../api/entity/rule/rule.dart';
import '../../lister/bloc/lister_bloc.dart';

class RulesBloc extends ListerBloc<Rule> {
  @override
  String get tableName => Rule.tableName;

  @override
  List<JoinTable> get joinTables => Rule.joinTables;

  @override
  String get fieldNames => Rule.fieldNames;

  @override
  String get orderBy => $CustomRuleImplJsonKeys.id;

  @override
  bool get ascending => false;

  @override
  String get idFieldKey => $CustomRuleImplJsonKeys.id;

  @override
  List<Rule>? Function(List<Map<String, Object?>> data) get converter =>
      Rule.converter;

  @override
  Rule Function(Map<String, Object?> json) get fromJson => Rule.fromJson;

  @override
  bool Function(Rule a, Rule b) get isAfter =>
      (final a, final b) => a.id > b.id;

  @override
  ListerFilters<Rule>? get filters => null;
}
