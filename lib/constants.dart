import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

final isDesktop = !kIsWeb && (Platform.isLinux || Platform.isMacOS || Platform.isWindows);
final skippedFocusNode = FocusNode(canRequestFocus: false, skipTraversal: true);

const highlightColors = {
  0: Colors.red,
  1: Colors.orange,
  2: Colors.yellow,
};
