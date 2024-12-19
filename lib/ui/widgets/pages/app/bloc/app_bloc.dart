import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../../api/database.dart';

part 'app_bloc.freezed.dart';
part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc()
      : super(
          db.auth.currentSession?.isExpired ?? true
              ? const AppState(
                  isSignedIn: false,
                )
              : const AppState(
                  isSignedIn: true,
                ),
        ) {
    on<AppEvent>((final event, final emit) async {
      return switch (event) {
        AppEventSignedIn() => emit(
            state.copyWith(
              isSignedIn: true,
            ),
          ),
        AppEventSignOutRequested() => _onSignOutRequested(event, emit),
        _AppEventSessionExpired() => emit(
            state.copyWith(
              isSignedIn: false,
            ),
          ),
      };
    });
    _authSubscription = db.auth.onAuthStateChange.listen(_onAuthStateChange);
  }

  Future<void> _onSignOutRequested(final AppEventSignOutRequested event, final Emitter<AppState> emit) async {
    try {
      await db.auth.signOut();
    } catch (e) {
      emit(
        state.copyWith(
          error: e.toString(),
        ),
      );
    }
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
