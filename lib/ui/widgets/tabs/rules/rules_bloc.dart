import '../../../../api/entity/join_table.dart';
import '../../../../api/entity/rule/rule.dart';
import '../../lister/bloc/lister_bloc.dart';

class RulesBloc extends ListerBloc<Rule> {
  @override
  String tableName = Rule.tableName;

  @override
  List<JoinTable> joinTables = Rule.joinTables;

  @override
  String fieldNames = Rule.fieldNames;

  @override
  String orderBy = $CustomRuleImplJsonKeys.id;

  @override
  bool ascending = false;

  @override
  List<Rule>? converter(final List<Map<String, Object?>> data) =>
      Rule.converter(data);

  @override
  Rule fromJson(final Map<String, Object?> json) => Rule.fromJson(json);

  @override
  bool isAfter(final Rule a, final Rule b) => a.id > b.id;

  @override
  bool isSame(final Map<String, Object?> a, final Rule b) =>
      a[$CustomRuleImplJsonKeys.id] == b.id;

  @override
  ListerFilters<Rule>? filters;
}
