import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';

import 'home_state.dart';

class HomeModel extends RestorableProperty {
  HomeState _state = const HomeState();

  void setTab(final int newIndex) {
    if (_state.history.lastOrNull == newIndex) return;

    final newHistory = [
      if (_state.history.isNotEmpty) ...[
        _state.history.first,
        ..._state.history.sublist(1).where((final index) => index != newIndex),
      ],
      newIndex,
    ];

    _state = _state.copyWith(history: newHistory);
    notifyListeners();
  }

  void goBack(final TabsRouter tabsRouter) {
    _state = _state.copyWith(history: _state.history.sublist(0, _state.history.length - 1));
    notifyListeners();
    tabsRouter.setActiveIndex(_state.history.lastOrNull ?? 0);
  }

  @override
  HomeModel createDefaultValue() => this;

  @override
  void initWithValue(final Object? value) {}

  @override
  HomeModel fromPrimitives(final Object? data) {
    if (data != null) {
      _state = HomeState.fromJson((data as Map<Object?, Object?>).cast());
    }
    return this;
  }

  @override
  Object? toPrimitives() {
    return _state.toJson();
  }
}
