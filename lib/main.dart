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

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(final BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: lightTheme,
      darkTheme: darkTheme(context),
      debugShowCheckedModeBanner: false,
      initialRoute: db.auth.currentSession?.isExpired == false ? Home.route : Login.route,
      routes: {
        Home.route: (final context) => const HomePage(),
        Login.route: (final context) => const LoginWidget(),
      },
    );
  }
}
