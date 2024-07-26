import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:media_kit/media_kit.dart';
import 'package:path_provider/path_provider.dart';

import 'api/database.dart';
import 'bloc_observer.dart';
import 'ui/theme.dart';
import 'ui/widgets/pages/home/home_page.dart';
import 'ui/widgets/pages/login/login_model.dart';
import 'ui/widgets/pages/login/login_widget.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  MediaKit.ensureInitialized();
  await Database.init();
  Bloc.observer = AppBlocObserver();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb ? HydratedStorage.webStorageDirectory : await getApplicationDocumentsDirectory(),
  );
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
      darkTheme: darkTheme,
      scrollBehavior: const CupertinoScrollBehavior().copyWith(
        dragDevices: _dragDevices,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: db.auth.currentSession?.isExpired == false ? HomePage.route : Login.route,
      routes: {
        HomePage.route: (final context) => const HomePage(),
        Login.route: (final context) => const LoginWidget(),
      },
    );
  }
}
