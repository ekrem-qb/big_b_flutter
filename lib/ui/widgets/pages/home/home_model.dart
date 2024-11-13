import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';

import 'home_state.dart';

class HomeModel extends RestorableProperty<HomeState> {
  HomeModel(this._tabsRouter) {
    _tabsRouter.addListener(_onTabChanged);
  }
  HomeState _state = const HomeState();

  final TabsRouter _tabsRouter;

  bool _canPop = false;
  bool get canGoBack => !_canPop && _state.history.length > 1;

  void onRouteChanged() {
    final value = _tabsRouter.canPop();
    if (value == _canPop) return;

    _canPop = value;
    notifyListeners();
  }

  void _onTabChanged() {
    final newIndex = _tabsRouter.activeIndex;
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
    _tabsRouter.setActiveIndex(_state.history.lastOrNull ?? 0);
  }

  @override
  HomeState createDefaultValue() => HomeState(
        history: [
          _tabsRouter.activeIndex,
        ],
      );

  @override
  void initWithValue(final HomeState value) {
    _state = value;
  }

  @override
  HomeState fromPrimitives(final Object? data) {
    return data != null ? HomeState.fromJson((data as Map<Object?, Object?>).cast()) : const HomeState();
  }

  @override
  Object? toPrimitives() {
    return _state.toJson();
  }

  @override
  void dispose() {
    _tabsRouter.removeListener(_onTabChanged);
    super.dispose();
  }
}
