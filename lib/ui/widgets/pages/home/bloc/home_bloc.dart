import 'dart:async';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../../api/database.dart';

part 'home_bloc.freezed.dart';
part 'home_bloc.g.dart';
part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends HydratedBloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeState()) {
    on<HomeEvent>((final event, final emit) {
      return switch (event) {
        HomeTabChanged() => emit(state.copyWith(selectedTabIndex: event.index)),
        _HomeSignedOut() => emit(state.copyWith(authStatus: AuthStatus.signedOut)),
      };
    });
    _authSubscription = db.auth.onAuthStateChange.listen(_onAuthStateChange);
  }

  StreamSubscription? _authSubscription;

  void _onAuthStateChange(final AuthState authState) {
    switch (authState.event) {
      case AuthChangeEvent.signedOut:
      case AuthChangeEvent.userDeleted:
        add(const _HomeSignedOut());
      default:
    }
  }

  @override
  Future<void> close() {
    _authSubscription?.cancel();
    return super.close();
  }

  @override
  HomeState? fromJson(final Map<String, dynamic> json) {
    try {
      return HomeState.fromJson(json);
    } on Exception {
      return null;
    }
  }

  @override
  Map<String, dynamic>? toJson(final HomeState state) {
    try {
      return state.toJson();
    } on Exception {
      return null;
    }
  }
}
