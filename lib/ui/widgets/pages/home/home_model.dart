import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';

import 'home_state.dart';

class HomeModel extends RestorableProperty {
  HomeState _state = const HomeState();

  TabsRouter? _tabsRouter;
  // ignore: avoid_setters_without_getters
  set tabsRouter(final TabsRouter? value) {
    if (value == _tabsRouter) return;

    _tabsRouter = value;
  }

  bool get canGoBack => _state.history.length > 1;

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

  void goBack() {
    if (_state.history.isEmpty) return;

    _state = _state.copyWith(history: _state.history.sublist(0, _state.history.length - 1));
    notifyListeners();
    _tabsRouter?.setActiveIndex(_state.history.lastOrNull ?? 0);
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
