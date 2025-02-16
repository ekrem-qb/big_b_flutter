import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../../api/database.dart';
import '../../../app_router/app_router.dart';
import '../../../theme.dart';
import '../../extensions/mouse_navigator.dart';

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
    return MouseNavigator(
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
          reevaluateListenable: ReevaluateListenable.stream(
            db.auth.onAuthStateChange,
          ),
          navRestorationScopeId: 'navigation',
        ),
      ),
    );
  }
}
