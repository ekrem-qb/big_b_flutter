import 'dart:typed_data';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';

import 'home_state.dart';

class HomeModel extends RestorableProperty<HomeState> {
  HomeModel(this._tabsRouter) {
    _tabsRouter.addListener(_onTabChanged);
  }
  HomeState _state = HomeState(history: Uint8List(0));

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

    final newHistory = Uint8List.fromList([
      if (_state.history.lengthInBytes > 0) ...[
        _state.history[0],
        ...Uint8List.sublistView(_state.history, 1).where((final index) => index != newIndex),
      ],
      newIndex,
    ]);

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
        history: Uint8List.fromList([
          _tabsRouter.activeIndex,
        ]),
      );

  @override
  void initWithValue(final HomeState value) {
    _state = value;
  }

  @override
  HomeState fromPrimitives(final Object? data) {
    return data != null ? HomeState.fromJson((data as Map<Object?, Object?>).cast()) : HomeState(history: Uint8List(0));
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
