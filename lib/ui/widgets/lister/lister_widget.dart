import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../api/entity/entity.dart';
import '../error_panel.dart';
import '../extensions/fade_transition_builder.dart';
import '../extensions/shimmer.dart';
import '../extensions/smooth_mouse_scroll/smooth_mouse_scroll.dart';
import '../list_view_shimmer.dart';
import 'bloc/lister_bloc.dart';

typedef ItemContentBuilder<TItem> = Widget Function(TItem);

class Lister<TBloc extends ListerBloc<TItem>, TItem extends Entity> extends StatelessWidget {
  const Lister({
    required this.blocCreator,
    required this.itemContentBuilder,
    required this.noItemsIcon,
    required this.noItemsText,
    super.key,
  });

  final ItemContentBuilder<TItem> itemContentBuilder;
  final IconData noItemsIcon;
  final String noItemsText;
  final TBloc Function() blocCreator;

  @override
  Widget build(final BuildContext context) {
    return BlocProvider<TBloc>(
      create: (final _) => blocCreator(),
      child: _ItemsList<TBloc, TItem>(
        itemContentBuilder,
        noItemsIcon,
        noItemsText,
      ),
    );
  }
}

class _ItemsList<TBloc extends ListerBloc<TItem>, TItem extends Entity> extends StatelessWidget {
  const _ItemsList(
    this.itemContentBuilder,
    this.noItemsIcon,
    this.noItemsText,
  );

  final ItemContentBuilder<TItem> itemContentBuilder;
  final IconData noItemsIcon;
  final String noItemsText;

  @override
  Widget build(final BuildContext context) {
    late final TBloc bloc;
    var isInitialized = false;
    context.select((final TBloc newBloc) {
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
        ListerStateData() => _ItemsListContent<TBloc, TItem>(itemContentBuilder, noItemsIcon, noItemsText),
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

class _ItemsListContent<TBloc extends ListerBloc<TItem>, TItem extends Entity> extends StatelessWidget {
  const _ItemsListContent(this.itemContentBuilder, this.noItemsIcon, this.noItemsText);

  final ItemContentBuilder<TItem> itemContentBuilder;
  final IconData noItemsIcon;
  final String noItemsText;

  @override
  Widget build(final BuildContext context) {
    final count = context.select((final TBloc bloc) {
      return switch (bloc.state) {
        ListerStateData(
          :final totalCount
        ) =>
          totalCount,
        _ => 0,
      };
    });

    return count == 0
        ? Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  noItemsIcon,
                  size: 64,
                ),
                Text(noItemsText),
              ],
            ),
          )
        : SmoothMouseScroll(
            builder: (final context, final child, final controller, final physics) {
              return ListView.builder(
                controller: controller,
                physics: physics,
                itemBuilder: (final context, final index) => _Item<TBloc, TItem>(context, index, itemContentBuilder),
                itemCount: count,
              );
            },
          );
  }
}

class _Item<TBloc extends ListerBloc<TItem>, TItem extends Entity> extends StatelessWidget {
  const _Item(final BuildContext _, this.index, this.itemContentBuilder);

  final int index;
  final ItemContentBuilder<TItem> itemContentBuilder;

  @override
  Widget build(final BuildContext context) {
    late final TBloc bloc;
    var isInitialized = false;
    final exists = context.select((final TBloc newBloc) {
      if (!isInitialized) {
        bloc = newBloc;
        isInitialized = true;
      }
      return switch (bloc.state) {
        ListerStateData(
          :final totalCount,
        ) =>
          totalCount > index,
        _ => false,
      };
    });
    final isLoaded = context.select((final TBloc bloc) {
      return switch (bloc.state) {
        ListerStateData(
          :final items,
        ) =>
          items.length > index,
        _ => false,
      };
    });
    final colorScheme = Theme.of(context).colorScheme;

    if (exists && !isLoaded) {
      bloc.add(ListerEventLoadAfterRequested(index));
    }

    return exists
        ? Shimmer.fromColors(
            baseColor: colorScheme.surfaceContainerLow,
            highlightColor: colorScheme.surfaceTint,
            enabled: !isLoaded,
            child: Card(
              child: _ItemContent<TBloc, TItem>(index, itemContentBuilder),
            ),
          )
        : const SizedBox.shrink();
  }
}

class _ItemContent<TBloc extends ListerBloc<TItem>, TItem extends Entity> extends StatelessWidget {
  const _ItemContent(this.index, this.itemContentBuilder);

  final int index;
  final ItemContentBuilder<TItem> itemContentBuilder;

  @override
  Widget build(final BuildContext context) {
    late final TBloc bloc;
    var isInitialized = false;
    final item = context.select((final TBloc newBloc) {
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

    return item != null
        ? itemContentBuilder(item)
        : const ListTile(
            title: Text(''),
            subtitle: Text(''),
          );
  }
}
