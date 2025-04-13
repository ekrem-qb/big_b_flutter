// ignore_for_file: prefer_initializing_formals

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../entity/status.dart';
import '../error_panel.dart';
import '../extensions/fade_transition_builder.dart';
import '../extensions/shimmer.dart';
import '../extensions/smooth_mouse_scroll/smooth_mouse_scroll.dart';
import '../list_view_shimmer.dart';
import 'bloc/lister_bloc.dart';

typedef ItemBuilder<TItem> = Widget Function(TItem?);
typedef ItemContentBuilder<TItem> = Widget Function(TItem);
typedef ListBuilder<TBloc, TItem> =
    Widget Function(int totalCount, ItemBuilder<TItem> itemBuilder);

class Lister<TBloc extends ListerBloc<TItem>, TItem> extends StatelessWidget {
  const Lister({
    required this.blocCreator,
    required this.listBuilder,
    required this.loadingShimmer,
    required final ItemBuilder<TItem> itemBuilder,
    required this.noItemsIcon,
    required this.noItemsText,
    super.key,
  }) : itemBuilder = itemBuilder,
       itemContentBuilder = null;

  const Lister.cards({
    required this.blocCreator,
    required final ItemContentBuilder<TItem> itemContentBuilder,
    required this.noItemsIcon,
    required this.noItemsText,
    super.key,
  }) : listBuilder = buildCardsList<TBloc, TItem>,
       itemBuilder = null,
       itemContentBuilder = itemContentBuilder,
       loadingShimmer = const ListViewShimmer();

  final ListBuilder<TBloc, TItem> listBuilder;
  final Widget loadingShimmer;
  final ItemBuilder<TItem>? itemBuilder;
  final ItemContentBuilder<TItem>? itemContentBuilder;
  final IconData noItemsIcon;
  final String noItemsText;
  final TBloc Function() blocCreator;

  static Widget Function(TItem?) buildItem<TItem>(
    final Widget Function(TItem item) itemContentBuilder,
  ) {
    return (final item) {
      return Card(
        child:
            item != null
                ? itemContentBuilder(item)
                : const ListTile(title: Text(''), subtitle: Text('')),
      );
    };
  }

  static Widget buildCardsList<TBloc extends ListerBloc<TItem>, TItem>(
    final int totalCount,
    final ItemBuilder<TItem> itemBuilder,
  ) {
    return SmoothMouseScroll(
      builder: (final context, final child, final controller, final physics) {
        return ListView.builder(
          controller: controller,
          physics: physics,
          itemCount: totalCount,
          itemBuilder: (final context, final index) {
            return _Item<TBloc, TItem>(context, index, itemBuilder);
          },
        );
      },
    );
  }

  @override
  Widget build(final BuildContext context) {
    return BlocProvider<TBloc>(
      create: (final _) => blocCreator(),
      child: _ItemsList<TBloc, TItem>(
        listBuilder,
        loadingShimmer,
        itemBuilder ?? buildItem<TItem>(itemContentBuilder!),
        noItemsIcon,
        noItemsText,
      ),
    );
  }
}

class _ItemsList<TBloc extends ListerBloc<TItem>, TItem>
    extends StatelessWidget {
  const _ItemsList(
    this.listBuilder,
    this.loadingShimmer,
    this.itemBuilder,
    this.noItemsIcon,
    this.noItemsText,
  );

  final ListBuilder<TBloc, TItem> listBuilder;
  final Widget loadingShimmer;
  final ItemBuilder<TItem> itemBuilder;
  final IconData noItemsIcon;
  final String noItemsText;

  @override
  Widget build(final BuildContext context) {
    final (bloc, _) = context.select(
      (final TBloc bloc) => (bloc, bloc.state.runtimeType),
    );

    return AnimatedSwitcher(
      duration: Durations.medium1,
      transitionBuilder: fadeTransitionBuilder,
      child: switch (bloc.state) {
        StatusOfLoading() => loadingShimmer,
        StatusOfData() => _ItemsListContent<TBloc, TItem>(
          listBuilder,
          itemBuilder,
          noItemsIcon,
          noItemsText,
        ),
        StatusOfError(:final error) => ErrorPanel(
          error: error.toString(),
          onRefresh: () => bloc.add(const ListerEventLoadRequested()),
        ),
      },
    );
  }
}

class _ItemsListContent<TBloc extends ListerBloc<TItem>, TItem>
    extends StatelessWidget {
  const _ItemsListContent(
    this.listBuilder,
    this.itemBuilder,
    this.noItemsIcon,
    this.noItemsText,
  );

  final ListBuilder<TBloc, TItem> listBuilder;
  final ItemBuilder<TItem> itemBuilder;
  final IconData noItemsIcon;
  final String noItemsText;

  @override
  Widget build(final BuildContext context) {
    final count = context.select((final TBloc bloc) {
      return switch (bloc.state) {
        StatusOfData(:final data) => data.totalCount,
        _ => 0,
      };
    });

    return count == 0
        ? Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [Icon(noItemsIcon, size: 64), Text(noItemsText)],
          ),
        )
        : listBuilder(count, itemBuilder);
  }
}

class _Item<TBloc extends ListerBloc<TItem>, TItem> extends StatelessWidget {
  const _Item(final BuildContext _, this.index, this.itemBuilder);

  final int index;
  final ItemBuilder<TItem> itemBuilder;

  @override
  Widget build(final BuildContext context) {
    final (bloc, exists, isLoaded) = context.select((final TBloc bloc) {
      return switch (bloc.state) {
        StatusOfData(:final data) => (
          bloc,
          data.totalCount > index,
          data.items.length > index,
        ),
        _ => (bloc, false, false),
      };
    });
    final colorScheme = ColorScheme.of(context);

    if (exists && !isLoaded) {
      bloc.add(ListerEventLoadAfterRequested(index));
    }

    return exists
        ? Shimmer.fromColors(
          baseColor: colorScheme.surfaceContainerLow,
          highlightColor:
              Color.lerp(
                colorScheme.onSurface,
                colorScheme.surfaceContainerLow,
                0.85,
              )!,
          enabled: !isLoaded,
          child: _ItemContent<TBloc, TItem>(index, itemBuilder),
        )
        : const SizedBox.shrink();
  }
}

class _ItemContent<TBloc extends ListerBloc<TItem>, TItem>
    extends StatelessWidget {
  const _ItemContent(this.index, this.itemBuilder);

  final int index;
  final ItemBuilder<TItem> itemBuilder;

  @override
  Widget build(final BuildContext context) {
    final item = context.select((final TBloc bloc) {
      return switch (bloc.state) {
        StatusOfData(:final data) => data.items.elementAtOrNull(index),
        _ => null,
      };
    });

    return itemBuilder(item);
  }
}
