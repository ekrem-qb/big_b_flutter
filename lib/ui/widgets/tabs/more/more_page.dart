import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../pages/app/bloc/app_bloc.dart';

@RoutePage()
class MorePage extends StatelessWidget {
  const MorePage({super.key});

  @override
  Widget build(final BuildContext context) {
    return Column(
      children: [
        AppBar(
          actions: const [
            _LogoutButton(),
          ],
          elevation: 4,
        ),
      ],
    );
  }
}

class _LogoutButton extends StatelessWidget {
  const _LogoutButton();

  @override
  Widget build(final BuildContext context) {
    final model = context.read<AppBloc>();

    return ElevatedButton(
      onPressed: () => model.add(const AppEventSignOutRequested()),
      child: const Text('Çıkış'),
    );
  }
}
