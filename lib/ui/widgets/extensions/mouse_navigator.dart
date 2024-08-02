import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/widgets.dart';

class MouseNavigator extends StatelessWidget {
  const MouseNavigator({required this.child, super.key});

  final Widget child;

  @override
  Widget build(final BuildContext context) {
    return kIsWeb
        ? child
        : Listener(
            onPointerDown: (final pointerEvent) {
              if (pointerEvent.buttons == kBackMouseButton) {
                Navigator.maybePop(context);
              }
            },
            child: child,
          );
  }
}
