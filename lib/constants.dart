import 'dart:io';

import 'package:flutter/foundation.dart';

final bool isDesktop = !kIsWeb && (Platform.isLinux || Platform.isMacOS || Platform.isWindows);
