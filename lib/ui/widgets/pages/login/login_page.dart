import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../entity/status.dart';
import '../../extensions/snackbar.dart';
import '../app/bloc/app_bloc.dart';
import 'bloc/login_bloc.dart';

@RoutePage()
class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(final BuildContext context) {
    return BlocProvider(
      create: (final context) => LoginBloc(),
      child: const LoginView(),
    );
  }
}

class LoginView extends StatelessWidget {
  const LoginView({
    super.key,
  });

  @override
  Widget build(final BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listenWhen: (final previous, final current) => previous.loginStatus != current.loginStatus,
      listener: (final context, final state) {
        switch (state.loginStatus) {
          case OperationStatusError(
              :final error,
            ):
            showSnackbar(text: error, context: context);
          case OperationStatusCompleted():
            context.read<AppBloc>().add(const AppEventSignedIn());
          default:
        }
      },
      child: const Scaffold(
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: EdgeInsets.all(64),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _EmailField(),
                    SizedBox(height: 16),
                    _PasswordField(),
                  ],
                ),
              ),
              _LoginButton(),
            ],
          ),
        ),
      ),
    );
  }
}

class _EmailField extends StatelessWidget {
  const _EmailField();

  @override
  Widget build(final BuildContext context) {
    final (
      bloc,
      emailError,
    ) = context.select(
      (final LoginBloc bloc) => (
        bloc,
        bloc.state.emailError,
      ),
    );

    return TextField(
      autofocus: true,
      decoration: InputDecoration(
        label: const Text('Kullanıcı adı'),
        prefixIcon: const Icon(Icons.account_circle),
        errorText: emailError,
      ),
      textInputAction: TextInputAction.next,
      onChanged: (final value) => bloc.add(LoginEventEmailChanged(value)),
    );
  }
}

class _PasswordField extends StatelessWidget {
  const _PasswordField();

  @override
  Widget build(final BuildContext context) {
    final (
      bloc,
      isPasswordVisible,
      passwordError,
    ) = context.select(
      (final LoginBloc bloc) => (
        bloc,
        bloc.state.isPasswordVisible,
        bloc.state.passwordError,
      ),
    );

    return TextField(
      decoration: InputDecoration(
        label: const Text('Şifre'),
        prefixIcon: const Icon(Icons.lock),
        suffixIcon: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6),
          child: IconButton(
            onPressed: () => bloc.add(const LoginEventPasswordVisibilityToggled()),
            icon: Icon(
              isPasswordVisible ? Icons.visibility : Icons.visibility_off,
            ),
          ),
        ),
        errorText: passwordError,
      ),
      obscureText: !isPasswordVisible,
      onChanged: (final value) => bloc.add(LoginEventPasswordChanged(value)),
      onSubmitted: (final value) => bloc.add(const LoginEventLoginRequested()),
    );
  }
}

class _LoginButton extends StatelessWidget {
  const _LoginButton();

  @override
  Widget build(final BuildContext context) {
    final (
      bloc,
      loginStatus,
    ) = context.select(
      (final LoginBloc bloc) => (
        bloc,
        bloc.state.loginStatus,
      ),
    );

    return FilledButton.icon(
      onPressed: loginStatus is OperationStatusInProgress ? null : () => bloc.add(const LoginEventLoginRequested()),
      label: const Text('Giriş'),
      icon: const _LoginIcon(),
      style: const ButtonStyle(
        visualDensity: VisualDensity.standard,
      ),
    );
  }
}

class _LoginIcon extends StatelessWidget {
  const _LoginIcon();

  @override
  Widget build(final BuildContext context) {
    final loginStatus = context.select((final LoginBloc bloc) {
      return bloc.state.loginStatus;
    });

    return loginStatus is OperationStatusInProgress
        ? SizedBox.square(
            dimension: IconTheme.of(context).size,
            child: CircularProgressIndicator(
              color: IconTheme.of(context).color,
              strokeWidth: 3,
            ),
          )
        : const Icon(Icons.login);
  }
}
