import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'api/database.dart';
import 'ui/theme.dart';
import 'ui/widgets/pages/home/home_model.dart';
import 'ui/widgets/pages/home/home_widget.dart';
import 'ui/widgets/pages/login/login_model.dart';
import 'ui/widgets/pages/login/login_widget.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Database.init();
  runApp(const MyApp());
}

const _dragDevices = {
  PointerDeviceKind.mouse,
  PointerDeviceKind.stylus,
  PointerDeviceKind.touch,
  PointerDeviceKind.trackpad,
};

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(final BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: lightTheme,
      darkTheme: darkTheme(context),
      scrollBehavior: const CupertinoScrollBehavior().copyWith(
        dragDevices: _dragDevices,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: db.auth.currentSession?.isExpired == false ? Home.route : Login.route,
      routes: {
        Home.route: (final context) => const HomePage(),
        Login.route: (final context) => const LoginWidget(),
      },
    );
  }
}
