import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../../api/database.dart';

part 'app_bloc.freezed.dart';
part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(db.auth.currentSession?.isExpired ?? true ? const AppState.signedOut() : const AppState.signedIn()) {
    on<AppEvent>((final event, final emit) async {
      return switch (event) {
        AppEventSignedIn() => emit(const AppStateSignedIn()),
        AppEventSignOutRequested() => await db.auth.signOut(),
        _AppEventSessionExpired() => emit(const AppStateSignedOut()),
      };
    });
    _authSubscription = db.auth.onAuthStateChange.listen(_onAuthStateChange);
  }

  StreamSubscription<AuthState>? _authSubscription;

  void _onAuthStateChange(final AuthState authState) {
    switch (authState.event) {
      case AuthChangeEvent.signedOut:
        add(const _AppEventSessionExpired());
      default:
    }
  }

  @override
  Future<void> close() {
    _authSubscription?.cancel();
    return super.close();
  }
}
