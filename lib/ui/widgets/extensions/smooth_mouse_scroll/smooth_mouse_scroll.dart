import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../theme.dart';

typedef ScrollBuilder =
    Widget Function(
      BuildContext context,
      Widget? child,
      ScrollController controller,
      ScrollPhysics? physics,
    );

class _Model {
  double offset = 0;
}

class SmoothMouseScroll extends StatefulWidget {
  const SmoothMouseScroll({
    required this.builder,
    this.child,
    this.controller,
    this.scrollSpeedMultiplier = 2,
    this.scrollAnimationDuration = scrollDuration,
    this.curve = scrollCurve,
    super.key,
  });

  ///Same ScrollController as the child widget's.
  final ScrollController? controller;

  ///Child scrollable widget.
  final Widget? child;

  ///Scroll speed px/scroll.
  final double scrollSpeedMultiplier;

  ///Scroll animation duration in milliseconds.
  final Duration scrollAnimationDuration;

  ///Curve of the animation.
  final Curve curve;

  final ScrollBuilder builder;

  @override
  State<SmoothMouseScroll> createState() => _SmoothMouseScrollState();
}

class _SmoothMouseScrollState extends State<SmoothMouseScroll> {
  late final ScrollController controller =
      widget.controller ?? ScrollController();

  @override
  Widget build(final BuildContext context) {
    return Provider(
      create: (final context) => _Model(),
      child: _Widget(
        controller: controller,
        scrollSpeedMultiplier: widget.scrollSpeedMultiplier,
        scrollAnimationDuration: widget.scrollAnimationDuration,
        curve: widget.curve,
        builder: widget.builder,
        child: widget.child,
      ),
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
    required this.builder,
  });

  final ScrollController controller;
  final double scrollSpeedMultiplier;
  final Duration scrollAnimationDuration;
  final Curve curve;
  final Widget? child;
  final ScrollBuilder builder;

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

            model.offset +=
                pointerSignal.scrollDelta.dy * scrollSpeedMultiplier;

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
      child: ListenableBuilder(
        listenable: WidgetsBinding.instance.mouseTracker,
        builder: (final context, final child) {
          return builder(
            context,
            child,
            controller,
            WidgetsBinding.instance.mouseTracker.mouseIsConnected
                ? const NeverScrollableScrollPhysics()
                : null,
          );
        },
        child: child,
      ),
    );
  }
}
