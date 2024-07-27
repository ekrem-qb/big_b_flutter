import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../app_router/app_router.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(final BuildContext context) {
    return AutoTabsScaffold(
      routes: const [
        TasksRoute(),
        RecordingsRoute(),
        ProfilesRoute(),
        MoreRoute(),
      ],
      bottomNavigationBuilder: (final context, final tabsRouter) {
        return NavigationBar(
          selectedIndex: tabsRouter.activeIndex,
          onDestinationSelected: tabsRouter.setActiveIndex,
          destinations: const [
            NavigationDestination(icon: Icon(Icons.task_alt), label: 'Görevler', tooltip: ''),
            NavigationDestination(icon: Icon(Icons.mic), label: 'Kayıtlar', tooltip: ''),
            NavigationDestination(icon: Icon(Icons.manage_accounts), label: 'Çalışanlar', tooltip: ''),
            NavigationDestination(icon: Icon(Icons.menu), label: 'Gene', tooltip: ''),
          ],
        );
      },
    );
  }
}
