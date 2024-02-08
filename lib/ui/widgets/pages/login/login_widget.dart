import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'login_model.dart';

class LoginWidget extends StatelessWidget {
  const LoginWidget({super.key});

  @override
  Widget build(final BuildContext context) {
    return ChangeNotifierProvider(
      create: (final context) => Login(),
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

class _LoginButton extends StatelessWidget {
  const _LoginButton();

  @override
  Widget build(final BuildContext context) {
    final model = context.read<Login>();

    return ElevatedButton(
      onPressed: () => model.login(context),
      child: const Text('Giriş'),
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
          ),
          const SizedBox(height: 16),
          TextField(
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              label: Text('Şifre'),
              prefixIcon: Icon(Icons.lock),
            ),
            controller: model.passwordController,
          ),
        ],
      ),
    );
  }
}
