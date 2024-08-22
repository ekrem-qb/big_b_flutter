import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

@pragma('vm:platform-const')
final isDesktop = !kIsWeb && (Platform.isLinux || Platform.isMacOS || Platform.isWindows);
final skippedFocusNode = FocusNode(canRequestFocus: false, skipTraversal: true);

const weekdayNames = [
  'Pzt',
  'Sal',
  'Çar',
  'Per',
  'Cum',
  'Cmt',
  'Paz',
];
