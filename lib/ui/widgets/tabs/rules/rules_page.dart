import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../../api/entity/rule/rule.dart';
import '../../../app_router/app_router.dart';
import '../../../theme.dart';
import '../../extensions/mouse_navigator.dart';
import '../../lister/lister_widget.dart';
import 'rules_bloc.dart';

@RoutePage()
class RulesPage extends StatelessWidget {
  const RulesPage({super.key});

  @override
  Widget build(final BuildContext context) {
    return MouseNavigator(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Kurallar'),
        ),
        body: const Lister<RulesBloc, Rule>.cards(
          blocCreator: RulesBloc.new,
          itemContentBuilder: _Item.new,
          noItemsIcon: Icons.rule,
          noItemsText: 'Kural bulunamadı',
        ),
        floatingActionButton: const _NewRuleButton(),
      ),
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

class _Item extends StatelessWidget {
  const _Item(this.rule);

  final Rule rule;

  @override
  Widget build(final BuildContext context) {
    return ListTile(
      shape: RoundedRectangleBorder(
        borderRadius: kDefaultRadius,
        side: BorderSide(
          width: 2,
          color: rule.color,
        ),
      ),
      title: Text(
        rule.description,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      subtitle: rule.details.isNotEmpty
          ? Text(
              rule.details,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            )
          : null,
      onTap: () => context.pushRoute(RuleEditorRoute(id: rule.id)),
    );
  }
}
