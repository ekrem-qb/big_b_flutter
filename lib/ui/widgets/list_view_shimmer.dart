import 'package:flutter/material.dart';

import 'extensions/shimmer.dart';

class ListViewShimmer extends StatelessWidget {
  const ListViewShimmer({
    super.key,
  });

  @override
  Widget build(final BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Shimmer.fromColors(
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
    );
  }
}
