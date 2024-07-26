import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../tabs/more/more_page.dart';
import '../../tabs/profiles/profiles_page.dart';
import '../../tabs/recordings/recordings_page.dart';
import '../../tabs/tasks/tasks_page.dart';
import 'bloc/home_bloc.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(final BuildContext context) {
    return BlocProvider(
      create: (final context) => HomeBloc(),
      child: const _HomeView(),
    );
  }
}

class _HomeView extends StatelessWidget {
  const _HomeView();

  @override
  Widget build(final BuildContext context) {
    return const Scaffold(
      body: _Body(),
      bottomNavigationBar: _NavBar(),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body();

  static const _tabs = [
    TasksPage(),
    RecordingsPage(),
    ProfilesPage(),
    MorePage(),
  ];

  @override
  Widget build(final BuildContext context) {
    late final HomeBloc model;
    var isInitialized = false;
    context.select((final HomeBloc newModel) {
      if (!isInitialized) {
        model = newModel;
        isInitialized = true;
      }
      return model.state.selectedTabIndex;
    });

    return _tabs[model.state.selectedTabIndex];
  }
}

class _NavBar extends StatelessWidget {
  const _NavBar();

  @override
  Widget build(final BuildContext context) {
    late final HomeBloc model;
    var isInitialized = false;
    context.select((final HomeBloc newModel) {
      if (!isInitialized) {
        model = newModel;
        isInitialized = true;
      }
      return model.state.selectedTabIndex;
    });

    return NavigationBar(
      selectedIndex: model.state.selectedTabIndex,
      onDestinationSelected: (final int index) => model.add(HomeTabChanged(index)),
      destinations: const [
        NavigationDestination(icon: Icon(Icons.task_alt), label: 'Görevler', tooltip: ''),
        NavigationDestination(icon: Icon(Icons.mic), label: 'Kayıtlar', tooltip: ''),
        NavigationDestination(icon: Icon(Icons.manage_accounts), label: 'Çalışanlar', tooltip: ''),
        NavigationDestination(icon: Icon(Icons.menu), label: 'Gene', tooltip: ''),
      ],
    );
  }
}
