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
                // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
                WidgetsBinding.instance.handlePopRoute();
              }
            },
            child: child,
          );
  }
}
