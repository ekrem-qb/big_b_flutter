import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../../app_router/app_router.dart';

class MouseNavigator extends StatelessWidget {
  const MouseNavigator({required this.child, super.key});

  final Widget child;

  @override
  Widget build(final BuildContext context) {
    final router = context.read<AppRouter?>();

    return kIsWeb
        ? child
        : Listener(
            onPointerDown: (final pointerEvent) {
              if (pointerEvent.buttons == kBackMouseButton) {
                (router?.navigationHistory.length ?? 0) > 2 ? router?.back() : Navigator.maybePop(context);
              }
            },
            child: child,
          );
  }
}
