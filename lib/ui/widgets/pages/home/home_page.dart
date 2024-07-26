import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../login/login_model.dart';
import '../more/more_page.dart';
import '../profiles/profiles_widget.dart';
import '../recordings/recordings_widget.dart';
import '../tasks/tasks_widget.dart';
import 'bloc/home_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const String route = '/home';

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
    return BlocListener<HomeBloc, HomeState>(
      listener: (final context, final state) {
        if (state.authStatus == AuthStatus.signedOut) {
          Navigator.pushReplacementNamed(context, Login.route);
        }
      },
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
    RecordingsWidget(),
    ProfilesWidget(),
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
