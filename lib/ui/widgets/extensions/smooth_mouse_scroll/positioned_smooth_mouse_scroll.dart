import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../../../theme.dart';

typedef PositionedScrollBuilder = Widget Function(BuildContext context, Widget? child, ScrollOffsetController controller, ScrollPhysics? physics);

class PositionedSmoothMouseScroll extends StatefulWidget {
  const PositionedSmoothMouseScroll({
    required this.builder,
    this.controller,
    this.child,
    this.scrollSpeedMultiplier = 2,
    this.scrollAnimationDuration = scrollDuration,
    this.curve = scrollCurve,
    super.key,
  });

  ///Same ScrollOffsetController as the child widget's.
  final ScrollOffsetController? controller;

  ///Child scrollable widget.
  final Widget? child;

  ///Scroll speed px/scroll.
  final double scrollSpeedMultiplier;

  ///Scroll animation duration in milliseconds.
  final Duration scrollAnimationDuration;

  ///Curve of the animation.
  final Curve curve;

  final PositionedScrollBuilder builder;

  @override
  State<PositionedSmoothMouseScroll> createState() => _PositionedSmoothMouseScrollState();
}

class _PositionedSmoothMouseScrollState extends State<PositionedSmoothMouseScroll> {
  late final ScrollOffsetController controller = widget.controller ?? ScrollOffsetController();

  @override
  Widget build(final BuildContext context) {
    return Listener(
      onPointerSignal: (final pointerSignal) {
        if (pointerSignal is PointerScrollEvent) {
          controller.animateScroll(
            offset: pointerSignal.scrollDelta.dy * widget.scrollSpeedMultiplier,
            duration: widget.scrollAnimationDuration,
            curve: widget.curve,
          );
        }
      },
      child: ListenableBuilder(
        listenable: WidgetsBinding.instance.mouseTracker,
        builder: (final context, final child) {
          return widget.builder(
            context,
            child,
            controller,
            WidgetsBinding.instance.mouseTracker.mouseIsConnected ? const NeverScrollableScrollPhysics() : null,
          );
        },
        child: widget.child,
      ),
    );
  }
}
