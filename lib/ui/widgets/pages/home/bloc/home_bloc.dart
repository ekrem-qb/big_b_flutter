import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../../api/database.dart';

part 'home_bloc.freezed.dart';
part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
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
}
