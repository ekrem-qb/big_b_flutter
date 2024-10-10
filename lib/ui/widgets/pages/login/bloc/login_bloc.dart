import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../api/database.dart';
import '../../../../entity/status.dart';

part 'login_bloc.freezed.dart';
part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(const LoginState()) {
    on<LoginEvent>((final event, final emit) async {
      return switch (event) {
        LoginEventEmailChanged() => _onEmailChanged(event, emit),
        LoginEventPasswordChanged() => _onPasswordChanged(event, emit),
        LoginEventPasswordVisibilityToggled() => _onPasswordVisibilityToggled(event, emit),
        LoginEventLoginRequested() => _onLoginRequested(event, emit),
      };
    });
  }

  void _onEmailChanged(
    final LoginEventEmailChanged event,
    final Emitter<LoginState> emit,
  ) {
    emit(
      state.copyWith(
        email: event.email.trim(),
        emailError: null,
      ),
    );
  }

  void _onPasswordChanged(
    final LoginEventPasswordChanged event,
    final Emitter<LoginState> emit,
  ) {
    emit(
      state.copyWith(
        password: event.password.trim(),
        passwordError: null,
      ),
    );
  }

  void _onPasswordVisibilityToggled(
    final LoginEventPasswordVisibilityToggled event,
    final Emitter<LoginState> emit,
  ) {
    emit(state.copyWith(isPasswordVisible: !state.isPasswordVisible));
  }

  Future<void> _onLoginRequested(
    final LoginEventLoginRequested event,
    final Emitter<LoginState> emit,
  ) async {
    if (state is OperationStatusInProgress) return;

    if (state.email.isEmpty) {
      emit(state.copyWith(emailError: 'Kullanıcı adı giriniz'));
      return;
    }

    if (state.password.isEmpty) {
      emit(state.copyWith(passwordError: 'Şifre giriniz'));
      return;
    }

    emit(state.copyWith(loginStatus: const OperationStatusInProgress()));

    try {
      final response = await db.auth.signInWithPassword(
        email: state.email,
        password: state.password,
      );

      if (response.user == null || response.session == null) {
        throw Exception('Beklenmeyen bir hata oluştu');
      }

      emit(
        state.copyWith(
          loginStatus: const OperationStatusCompleted(),
        ),
      );
    } on Exception catch (e) {
      emit(
        state.copyWith(
          loginStatus: OperationStatusError(e.toString()),
        ),
      );
    } finally {
      emit(
        state.copyWith(
          loginStatus: const OperationStatusInitial(),
        ),
      );
    }
  }
}
