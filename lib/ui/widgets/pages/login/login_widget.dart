import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'login_model.dart';

class LoginWidget extends StatelessWidget {
  const LoginWidget({super.key});

  @override
  Widget build(final BuildContext context) {
    return ChangeNotifierProvider(
      create: Login.new,
      child: const Scaffold(
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _Fields(),
              _LoginButton(),
            ],
          ),
        ),
      ),
    );
  }
}

class _Fields extends StatelessWidget {
  const _Fields();

  @override
  Widget build(final BuildContext context) {
    final model = context.read<Login>();

    return Padding(
      padding: const EdgeInsets.all(64),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            autofocus: true,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              label: Text('Kullanıcı adı'),
              prefixIcon: Icon(Icons.account_circle),
            ),
            controller: model.emailController,
            textInputAction: TextInputAction.next,
          ),
          const SizedBox(height: 16),
          const _PasswordField(),
        ],
      ),
    );
  }
}

class _PasswordField extends StatelessWidget {
  const _PasswordField();

  @override
  Widget build(final BuildContext context) {
    late final Login model;
    var isInitialized = false;
    context.select((final Login newModel) {
      if (!isInitialized) {
        model = newModel;
        isInitialized = true;
      }
      return model.isPasswordVisible;
    });

    return TextField(
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        label: const Text('Şifre'),
        prefixIcon: const Icon(Icons.lock),
        suffixIcon: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: IconButton(
            onPressed: model.togglePasswordVisibility,
            icon: Icon(model.isPasswordVisible ? Icons.visibility : Icons.visibility_off),
          ),
        ),
      ),
      obscureText: !model.isPasswordVisible,
      controller: model.passwordController,
      onSubmitted: (final value) => model.login(),
    );
  }
}

class _LoginButton extends StatelessWidget {
  const _LoginButton();

  @override
  Widget build(final BuildContext context) {
    final model = context.read<Login>();

    return ElevatedButton(
      onPressed: model.login,
      child: const Text('Giriş'),
    );
  }
}
