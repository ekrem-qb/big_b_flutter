import '../../../../api/entity/rule/rule.dart';
import '../../lister/bloc/lister_bloc.dart';

class RulesBloc extends ListerBloc<Rule> {
  @override
  String get tableName => Rule.tableName;

  @override
  String get fieldNames => Rule.fieldNames;

  @override
  String get orderBy => $RuleImplJsonKeys.description;

  @override
  bool get ascending => true;

  @override
  String get idFieldKey => $RuleImplJsonKeys.id;

  @override
  List<Rule>? Function(List<Map<String, dynamic>> data) get converter => Rule.converter;

  @override
  Rule Function(Map<String, dynamic> json) get fromJson => Rule.fromJson;

  @override
  bool Function(Rule a, Rule b) get isAfter => (final a, final b) => a.description.compareTo(b.description).isNegative;
}
