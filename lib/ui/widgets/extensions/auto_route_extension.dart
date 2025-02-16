import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';

extension AutoRouteExtension on TabsRouter {
  Future<void> navigateAll(final List<PageRouteInfo> routes) async {
    final firstRoute = routes.first;
    final path = matcher.buildPathTo(firstRoute)?.path;
    if (path != null &&
        (stackRouterOfIndex(activeIndex)?.currentPath.contains(path) ??
            false)) {
      for (var i = 0; i < routes.length; i++) {
        await navigate(routes[i]);
      }
    } else {
      await navigate(firstRoute);
      WidgetsBinding.instance.addPostFrameCallback((final _) {
        stackRouterOfIndex(activeIndex)?.pushAll(routes.sublist(1));
      });
    }
  }
}
