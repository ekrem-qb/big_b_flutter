import 'dart:io';

import 'package:flutter/services.dart';

abstract class Vibration {
  static void vibrate() {
    if (Platform.isIOS) {
      HapticFeedback.selectionClick();
    } else {
      HapticFeedback.lightImpact();
    }
  }
}
