import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../app_router/app_router.dart';
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
      body: const Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              _Button(
                icon: Icons.manage_accounts,
                label: 'Çalışanlar',
                route: ProfilesRoute(),
              ),
              _Button(
                icon: Icons.rule_rounded,
                label: 'Kurallar',
                route: RulesRoute(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _LogoutButton extends StatelessWidget {
  const _LogoutButton();

  @override
  Widget build(final BuildContext context) {
    final bloc = context.read<AppBloc>();

    final (
      appBar,
      isScrolled,
    ) = context.select(
      (final AppBarController appBar) => (
        appBar,
        appBar.isScrolled,
      ),
    );

    return ElevatedButton.icon(
      style: ButtonStyle(
        visualDensity: VisualDensity.standard,
        elevation: appBar.isScrolled ? const WidgetStatePropertyAll(0) : null,
      ),
      onPressed: () => bloc.add(const AppEventSignOutRequested()),
      icon: const Icon(Icons.logout),
      label: const Text('Çıkış'),
    );
  }
}

class _Button extends StatelessWidget {
  const _Button({
    required this.icon,
    required this.label,
    required this.route,
  });

  final IconData icon;
  final String label;
  final PageRouteInfo route;

  @override
  Widget build(final BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
      onPressed: () => context.pushRoute(route),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Column(
          children: [
            Icon(icon),
            const SizedBox(height: 8),
            Text(label),
          ],
        ),
      ),
    );
  }
}
