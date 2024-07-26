import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'more_model.dart';

class MorePage extends StatelessWidget {
  const MorePage({super.key});

  @override
  Widget build(final BuildContext context) {
    return ChangeNotifierProvider(
      create: (final context) => More(),
      child: Column(
        children: [
          AppBar(
            actions: const [
              _LogoutButton(),
            ],
            elevation: 4,
          ),
        ],
      ),
    );
  }
}

class _LogoutButton extends StatelessWidget {
  const _LogoutButton();

  @override
  Widget build(final BuildContext context) {
    final model = context.read<More>();

    return ElevatedButton(
      onPressed: model.logout,
      child: const Text('Çıkış'),
    );
  }
}
