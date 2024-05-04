import 'package:flutter/widgets.dart';

class AppBarController extends ChangeNotifier {
  bool _isScrolled = false;
  bool get isScrolled => _isScrolled;

  bool onScroll(final ScrollNotification notification) {
    final oldIsScrolled = _isScrolled;

    switch (notification.metrics.axisDirection) {
      case AxisDirection.up:
        _isScrolled = notification.metrics.extentAfter > 0;
      case AxisDirection.down:
        _isScrolled = notification.metrics.extentBefore > 0;
      default:
        break;
    }

    if (_isScrolled != oldIsScrolled) {
      notifyListeners();
    }

    return notification.depth == 0;
  }
}
