import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../constants.dart';

class PositionedSmoothScroll extends StatelessWidget {
  const PositionedSmoothScroll({
    required this.controller,
    required this.child,
    super.key,
    this.scrollSpeedMultiplier = 2,
    this.scrollAnimationDuration = scrollDuration,
    this.curve = scrollCurve,
  });

  ///Same ScrollOffsetController as the child widget's.
  final ScrollOffsetController controller;

  ///Child scrollable widget.
  final Widget child;

  ///Scroll speed px/scroll.
  final double scrollSpeedMultiplier;

  ///Scroll animation duration in milliseconds.
  final Duration scrollAnimationDuration;

  ///Curve of the animation.
  final Curve curve;

  @override
  Widget build(final BuildContext context) {
    return Listener(
      onPointerSignal: (final pointerSignal) {
        if (pointerSignal is PointerScrollEvent) {
          controller.animateScroll(
            offset: pointerSignal.scrollDelta.dy * scrollSpeedMultiplier,
            duration: scrollAnimationDuration,
            curve: curve,
          );
        }
      },
      child: child,
    );
  }
}
