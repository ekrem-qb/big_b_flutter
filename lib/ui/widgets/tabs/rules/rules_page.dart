import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../app_router/app_router.dart';
import '../../../theme.dart';
import '../../extensions/fade_transition_builder.dart';
import '../../extensions/mouse_navigator.dart';
import '../../extensions/shimmer.dart';
import '../../extensions/smooth_mouse_scroll/smooth_mouse_scroll.dart';
import 'bloc/rules_bloc.dart';

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
          shadowColor: Theme.of(context).shadowColor,
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
    final colorScheme = Theme.of(context).colorScheme;

    return AnimatedSwitcher(
      duration: Durations.medium1,
      transitionBuilder: fadeTransitionBuilder,
      child: switch (bloc.state) {
        RulesStateLoading() => Shimmer.fromColors(
            baseColor: colorScheme.surfaceContainerLow,
            highlightColor: colorScheme.surfaceTint,
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (final BuildContext context, final int index) {
                return const Card(
                  child: ListTile(
                    title: Text(''),
                    subtitle: Text(''),
                  ),
                );
              },
            ),
          ),
        RulesStateData() => const _RulesListContent(),
        RulesStateError(
          :final error
        ) =>
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.error_outline_rounded,
                size: 64,
              ),
              Padding(
                padding: const EdgeInsets.all(32),
                child: Text(
                  error,
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              ElevatedButton.icon(
                onPressed: () => bloc.add(const RulesEventLoadRequested()),
                icon: const Icon(Icons.refresh_rounded),
                label: const Text('Yenile'),
              ),
            ],
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
        RulesStateData(
          :final rules
        ) =>
          rules.length,
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
                itemBuilder: _ItemCard.new,
                itemCount: count,
              );
            },
          );
  }
}

class _ItemCard extends StatelessWidget {
  const _ItemCard(final BuildContext _, this.index);

  final int index;

  @override
  Widget build(final BuildContext context) {
    return Card(
      child: _Item(index),
    );
  }
}

class _Item extends StatelessWidget {
  const _Item(this.index);

  final int index;

  @override
  Widget build(final BuildContext context) {
    final exists = context.select((final RulesBloc bloc) {
      return switch (bloc.state) {
        RulesStateData(
          :final rules,
        ) =>
          rules.length >= index,
        _ => false,
      };
    });

    return exists ? _ItemContent(index) : const _DeletedItemContent();
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
        RulesStateData(
          :final rules,
        ) =>
          rules.elementAtOrNull(index),
        _ => null,
      };
    });

    return ListTile(
      mouseCursor: SystemMouseCursors.click,
      shape: RoundedRectangleBorder(
        borderRadius: kDefaultRadius,
        side: BorderSide(
          width: 2,
          color: rule?.color ?? Colors.grey,
        ),
      ),
      title: Text(
        rule?.description ?? '',
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      subtitle: Text(
        rule?.details ?? '',
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
      onTap: () => context.pushRoute(RuleEditorRoute(id: rule!.id)),
    );
  }
}

class _DeletedItemContent extends StatelessWidget {
  const _DeletedItemContent();

  @override
  Widget build(final BuildContext context) {
    return const ListTile(
      mouseCursor: SystemMouseCursors.click,
      title: Text(
        'Silinmiş',
        style: TextStyle(color: Colors.red),
      ),
    );
  }
}
