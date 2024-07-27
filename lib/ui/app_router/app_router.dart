import 'package:auto_route/auto_route.dart';

import '../widgets/pages/app/app_page.dart';
import '../widgets/pages/home/home_page.dart';
import '../widgets/pages/login/login_page.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes {
    return [
      AutoRoute(
        path: '/',
        page: AppRoute.page,
        initial: true,
        children: [
          AutoRoute(
            path: 'login',
            page: LoginRoute.page,
          ),
          AutoRoute(
            path: 'home',
            page: HomeRoute.page,
          ),
        ],
      ),
    ];
  }
}
