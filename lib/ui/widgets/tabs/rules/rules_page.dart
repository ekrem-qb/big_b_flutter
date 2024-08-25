import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../app_router/app_router.dart';
import '../../../theme.dart';
import '../../error_panel.dart';
import '../../extensions/fade_transition_builder.dart';
import '../../extensions/mouse_navigator.dart';
import '../../extensions/smooth_mouse_scroll/smooth_mouse_scroll.dart';
import '../../list_view_shimmer.dart';
import '../../lister/bloc/lister_bloc.dart';
import 'rules_bloc.dart';

@RoutePage()
class RulesPage extends StatelessWidget {
  const RulesPage({super.key});

  @override
  Widget build(final BuildContext context) {
    return BlocProvider(
      create: (final context) => RulesBloc(),
      child: const RulesView(),
    );
  }
}

class RulesView extends StatelessWidget {
  const RulesView({super.key});

  @override
  Widget build(final BuildContext context) {
    return MouseNavigator(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Kurallar'),
        ),
        body: const _RulesList(),
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

class _RulesList extends StatelessWidget {
  const _RulesList();

  @override
  Widget build(final BuildContext context) {
    late final RulesBloc bloc;
    var isInitialized = false;
    context.select((final RulesBloc newBloc) {
      if (!isInitialized) {
        bloc = newBloc;
        isInitialized = true;
      }
      return bloc.state.runtimeType;
    });

    return AnimatedSwitcher(
      duration: Durations.medium1,
      transitionBuilder: fadeTransitionBuilder,
      child: switch (bloc.state) {
        ListerStateLoading() => const ListViewShimmer(),
        ListerStateData() => const _RulesListContent(),
        ListerStateError(
          :final error
        ) =>
          ErrorPanel(
            error: error,
            onRefresh: () => bloc.add(const ListerEventLoadRequested()),
          ),
      },
    );
  }
}

class _RulesListContent extends StatelessWidget {
  const _RulesListContent();

  @override
  Widget build(final BuildContext context) {
    final count = context.select((final RulesBloc bloc) {
      return switch (bloc.state) {
        ListerStateData(
          :final items
        ) =>
          items.length,
        _ => 0,
      };
    });

    return count == 0
        ? const Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.rule,
                  size: 64,
                ),
                Text('No rules'),
              ],
            ),
          )
        : SmoothMouseScroll(
            builder: (final context, final child, final controller, final physics) {
              return ListView.builder(
                controller: controller,
                physics: physics,
                itemBuilder: _Item.new,
                itemCount: count,
              );
            },
          );
  }
}

class _Item extends StatelessWidget {
  const _Item(final BuildContext _, this.index);

  final int index;

  @override
  Widget build(final BuildContext context) {
    final exists = context.select((final RulesBloc bloc) {
      return switch (bloc.state) {
        ListerStateData(
          :final items,
        ) =>
          items.length >= index,
        _ => false,
      };
    });

    return exists
        ? Card(
            child: _ItemContent(index),
          )
        : const SizedBox.shrink();
  }
}

class _ItemContent extends StatelessWidget {
  const _ItemContent(this.index);

  final int index;

  @override
  Widget build(final BuildContext context) {
    late final RulesBloc bloc;
    var isInitialized = false;
    final rule = context.select((final RulesBloc newBloc) {
      if (!isInitialized) {
        bloc = newBloc;
        isInitialized = true;
      }
      return switch (bloc.state) {
        ListerStateData(
          :final items,
        ) =>
          items.elementAtOrNull(index),
        _ => null,
      };
    });

    return rule != null
        ? ListTile(
            mouseCursor: SystemMouseCursors.click,
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
          )
        : const SizedBox.shrink();
  }
}
