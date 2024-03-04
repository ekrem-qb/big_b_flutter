import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../more/more_widget.dart';
import '../planned_tasks/planned_tasks_widget.dart';
import '../tasks/tasks_widget.dart';
import 'home_model.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(final BuildContext context) {
    return ChangeNotifierProvider(
      create: Home.new,
      child: const Scaffold(
        body: _Body(),
        bottomNavigationBar: _NavBar(),
      ),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body();

  static const _tabs = [
    TasksWidget(),
    PlannedTasksWidget(),
    MorePage(),
  ];

  @override
  Widget build(final BuildContext context) {
    late final Home model;
    var isInitialized = false;
    context.select((final Home newModel) {
      if (!isInitialized) {
        model = newModel;
        isInitialized = true;
      }
      return model.selectedTabIndex;
    });

    return _tabs[model.selectedTabIndex];
  }
}

class _NavBar extends StatelessWidget {
  const _NavBar();

  @override
  Widget build(final BuildContext context) {
    late final Home model;
    var isInitialized = false;
    context.select((final Home newModel) {
      if (!isInitialized) {
        model = newModel;
        isInitialized = true;
      }
      return model.selectedTabIndex;
    });

    return NavigationBar(
      selectedIndex: model.selectedTabIndex,
      onDestinationSelected: model.setSelectedTabIndex,
      destinations: const [
        NavigationDestination(icon: Icon(Icons.task_alt), label: 'Görevler', tooltip: ''),
        NavigationDestination(icon: Icon(Icons.event_available), label: 'Görev Planlama', tooltip: ''),
        NavigationDestination(icon: Icon(Icons.menu), label: 'Gene', tooltip: ''),
      ],
    );
  }
}
