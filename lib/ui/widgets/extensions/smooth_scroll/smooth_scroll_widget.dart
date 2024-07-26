import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../theme.dart';

class _Model {
  double offset = 0;
}

class SmoothScroll extends StatelessWidget {
  const SmoothScroll({
    required this.controller,
    required this.child,
    super.key,
    this.scrollSpeedMultiplier = 2,
    this.scrollAnimationDuration = scrollDuration,
    this.curve = scrollCurve,
  });

  ///Same ScrollController as the child widget's.
  final ScrollController controller;

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
    return Provider(
      create: (final context) => _Model(),
      child: _Widget(controller: controller, scrollSpeedMultiplier: scrollSpeedMultiplier, scrollAnimationDuration: scrollAnimationDuration, curve: curve, child: child),
    );
  }
}

class _Widget extends StatelessWidget {
  const _Widget({
    required this.controller,
    required this.scrollSpeedMultiplier,
    required this.scrollAnimationDuration,
    required this.curve,
    required this.child,
  });

  final ScrollController controller;
  final double scrollSpeedMultiplier;
  final Duration scrollAnimationDuration;
  final Curve curve;
  final Widget child;

  @override
  Widget build(final BuildContext context) {
    final model = context.read<_Model>();

    controller.addListener(() {
      /// ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
      if (controller.position.activity is IdleScrollActivity) {
        model.offset = controller.position.extentBefore;
      }
    });

    return Listener(
      onPointerSignal: (final pointerSignal) {
        switch (pointerSignal) {
          case PointerScrollEvent():
            var milliseconds = scrollAnimationDuration.inMilliseconds;

            model.offset += pointerSignal.scrollDelta.dy * scrollSpeedMultiplier;

            if (model.offset > controller.position.maxScrollExtent) {
              model.offset = controller.position.maxScrollExtent;
              milliseconds = scrollAnimationDuration.inMilliseconds ~/ 2;
            }
            if (model.offset < 0) {
              model.offset = 0;
              milliseconds = scrollAnimationDuration.inMilliseconds ~/ 2;
            }

            controller.animateTo(
              model.offset,
              duration: Duration(milliseconds: milliseconds),
              curve: curve,
            );
        }
      },
      child: child,
    );
  }
}
