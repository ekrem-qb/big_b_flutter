import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../../api/entity/rule/rule.dart';
import '../../../app_router/app_router.dart';
import '../../lister/lister_widget.dart';
import '../../rule_tile.dart';
import 'rules_bloc.dart';

@RoutePage()
class RulesPage extends StatelessWidget {
  const RulesPage({super.key});

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Kurallar')),
      body: const Lister<RulesBloc, Rule>.cards(
        blocCreator: RulesBloc.new,
        itemContentBuilder: RuleTile.new,
        noItemsIcon: Icons.rule,
        noItemsText: 'Kural bulunamadı',
      ),
      floatingActionButton: const _NewRuleButton(),
    );
  }
}

class _NewRuleButton extends StatelessWidget {
  const _NewRuleButton();

  @override
  Widget build(final BuildContext context) {
    return FloatingActionButton(
      onPressed: () => context.pushRoute(const NewRuleEditorRoute()),
      child: const Icon(Icons.add),
    );
  }
}
