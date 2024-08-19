import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../app_router/app_router.dart';
import '../../extensions/mouse_navigator.dart';
import 'home_model.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with RestorationMixin {
  final _model = HomeModel();

  @override
  Widget build(final BuildContext context) {
    return ChangeNotifierProvider.value(
      value: _model,
      child: const _HomeView(),
    );
  }

  @override
  String? get restorationId => 'home';

  @override
  void restoreState(final RestorationBucket? oldBucket, final bool initialRestore) {
    registerForRestoration(_model, 'home');
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }
}

class _HomeView extends StatelessWidget {
  const _HomeView();

  @override
  Widget build(final BuildContext context) {
    late HomeModel model;
    final canGoBack = context.select((final HomeModel newModel) {
      model = newModel;
      return newModel.canGoBack;
    });
    final router = context.watchRouter;

    return PopScope(
      canPop: router.canPop() || !canGoBack,
      onPopInvokedWithResult: (final didPop, final result) {
        if (!didPop) model.goBack();
      },
      child: MouseNavigator(
        child: AutoTabsScaffold(
          routes: const [
            TasksRoute(),
            RecordingsRoute(),
            ProfilesRoute(),
            MoreRoute(),
          ],
          bottomNavigationBuilder: (final context, final tabsRouter) {
            WidgetsBinding.instance.addPostFrameCallback((final _) {
              model
                ..tabsRouter = tabsRouter
                ..setTab(tabsRouter.activeIndex);
            });

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
        ),
      ),
    );
  }
}
