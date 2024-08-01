import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../../../app_router/app_router.dart';
import '../../../theme.dart';
import 'bloc/app_bloc.dart';

const _dragDevices = {
  PointerDeviceKind.mouse,
  PointerDeviceKind.stylus,
  PointerDeviceKind.touch,
  PointerDeviceKind.trackpad,
};

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final appRouter = AppRouter();

  @override
  Widget build(final BuildContext context) {
    return MultiProvider(
      providers: [
        BlocProvider(create: (final context) => AppBloc()),
        ChangeNotifierProvider.value(value: appRouter),
      ],
      child: MaterialApp.router(
        title: 'Flutter Demo',
        theme: lightTheme,
        darkTheme: darkTheme,
        scrollBehavior: const CupertinoScrollBehavior().copyWith(
          dragDevices: _dragDevices,
        ),
        debugShowCheckedModeBanner: false,
        restorationScopeId: 'app',
        routerConfig: appRouter.config(
          navRestorationScopeId: 'navigation',
        ),
      ),
    );
  }
}

@RoutePage()
class AppPage extends StatelessWidget {
  const AppPage({super.key});

  @override
  Widget build(final BuildContext context) {
    final state = context.watch<AppBloc>().state;

    return AutoRouter.declarative(
      routes: (final handler) {
        return [
          switch (state) {
            AppStateSignedIn() => const HomeRoute(),
            AppStateSignedOut() => const LoginRoute(),
          },
        ];
      },
    );
  }
}
