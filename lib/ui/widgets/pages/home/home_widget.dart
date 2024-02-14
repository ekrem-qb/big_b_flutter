import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../recordings/recordings_widget.dart';
import 'home_model.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(final BuildContext context) {
    return ChangeNotifierProvider(
      create: Home.new,
      child: Scaffold(
        appBar: AppBar(
          actions: const [
            _LogoutButton(),
          ],
          elevation: 4,
        ),
        body: const RecordingsWidget(),
      ),
    );
  }
}

class _LogoutButton extends StatelessWidget {
  const _LogoutButton();

  @override
  Widget build(final BuildContext context) {
    final model = context.read<Home>();

    return ElevatedButton(
      onPressed: model.logout,
      child: const Text('Çıkış'),
    );
  }
}
