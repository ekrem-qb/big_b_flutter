import 'package:flutter/material.dart';

Widget fadeTransitionBuilder(final Widget child, final Animation<double> animation) {
  return FadeTransition(
    opacity: animation,
    child: child,
  );
}
