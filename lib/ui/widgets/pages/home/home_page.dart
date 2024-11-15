import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../app_router/app_router.dart';
import 'home_model.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(final BuildContext context) {
    return AutoTabsRouter(
      routes: [
        ViolationsRoute(),
        const RecordingsRoute(),
        const TasksRoute(),
        const MoreRoute(),
      ],
      transitionBuilder: (final context, final child, final animation) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
      builder: (final context, final child) {
        final tabsRouter = context.tabsRouter;

        void onDestinationSelected(final int newIndex) {
          if (newIndex == tabsRouter.activeIndex) {
            tabsRouter.navigate(tabsRouter.current.route.toPageRouteInfo());
          } else {
            tabsRouter.setActiveIndex(newIndex);
          }
        }

        return Scaffold(
          body: _Body(child: child),
          bottomNavigationBar: AnimatedBuilder(
            animation: tabsRouter,
            builder: (final _, final __) {
              return NavigationBar(
                selectedIndex: tabsRouter.activeIndex,
                onDestinationSelected: onDestinationSelected,
                destinations: const [
                  NavigationDestination(icon: Icon(Icons.home), label: 'Ana Sayfa', tooltip: ''),
                  NavigationDestination(icon: Icon(Icons.mic), label: 'Kayıtlar', tooltip: ''),
                  NavigationDestination(icon: Icon(Icons.task_alt), label: 'Görevler', tooltip: ''),
                  NavigationDestination(icon: Icon(Icons.menu), label: 'Gene', tooltip: ''),
                ],
              );
            },
          ),
        );
      },
    );
  }
}

class _Body extends StatefulWidget {
  const _Body({
    required this.child,
  });

  final Widget child;

  @override
  State<_Body> createState() => _BodyState();
}

class _BodyState extends State<_Body> with RestorationMixin {
  late final HomeModel _model;

  @override
  void initState() {
    _model = HomeModel(context.tabsRouter);
    super.initState();
  }

  @override
  Widget build(final BuildContext context) {
    return Stack(
      children: [
        Builder(
          builder: (final context) {
            context.watchRouter;
            WidgetsBinding.instance.addPostFrameCallback((final timeStamp) {
              _model.onRouteChanged();
            });

            return const SizedBox.shrink();
          },
        ),
        ListenableBuilder(
          listenable: _model,
          builder: (final context, final child) {
            return PopScope(
              canPop: !_model.canGoBack,
              onPopInvokedWithResult: (final didPop, final result) {
                if (!didPop) _model.goBack();
              },
              child: widget.child,
            );
          },
        ),
      ],
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
