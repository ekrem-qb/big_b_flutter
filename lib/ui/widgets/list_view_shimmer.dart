import 'package:flutter/material.dart';

import 'extensions/shimmer.dart';

class ListViewShimmer extends StatelessWidget {
  const ListViewShimmer({
    this.hasSubtitle = true,
    super.key,
  });

  final bool hasSubtitle;

  @override
  Widget build(final BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Shimmer.fromColors(
      baseColor: colorScheme.surfaceContainerLow,
      highlightColor: Color.lerp(colorScheme.onSurface, colorScheme.surfaceContainerLow, 0.85)!,
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (final BuildContext context, final int index) {
          return Card(
            child: ListTile(
              title: const Text(''),
              subtitle: hasSubtitle ? const Text('') : null,
            ),
          );
        },
      ),
    );
  }
}
