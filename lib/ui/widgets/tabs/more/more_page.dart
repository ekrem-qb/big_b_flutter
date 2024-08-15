import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../extensions/app_bar_controller.dart';
import '../../pages/app/bloc/app_bloc.dart';

@RoutePage()
class MorePage extends StatelessWidget {
  const MorePage({super.key});

  @override
  Widget build(final BuildContext context) {
    return ChangeNotifierProvider(
      create: (final _) => AppBarController(),
      child: const MoreView(),
    );
  }
}

class MoreView extends StatelessWidget {
  const MoreView({
    super.key,
  });

  @override
  Widget build(final BuildContext context) {
    final appBar = context.read<AppBarController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Gene'),
        notificationPredicate: appBar.onScroll,
        actions: const [
          _LogoutButton(),
          SizedBox(width: 8),
        ],
      ),
    );
  }
}

class _LogoutButton extends StatelessWidget {
  const _LogoutButton();

  @override
  Widget build(final BuildContext context) {
    final model = context.read<AppBloc>();
    late final AppBarController appBar;
    var isInitialized = false;
    context.select((final AppBarController newBloc) {
      if (!isInitialized) {
        appBar = newBloc;
        isInitialized = true;
      }
      return appBar.isScrolled;
    });

    return ElevatedButton.icon(
      style: ButtonStyle(
        visualDensity: VisualDensity.standard,
        elevation: appBar.isScrolled ? const WidgetStatePropertyAll(0) : null,
      ),
      onPressed: () => model.add(const AppEventSignOutRequested()),
      icon: const Icon(Icons.logout),
      label: const Text('Çıkış'),
    );
  }
}
