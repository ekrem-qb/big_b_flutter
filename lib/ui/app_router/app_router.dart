import 'package:auto_route/auto_route.dart';

import '../widgets/pages/app/app_page.dart';
import '../widgets/pages/home/home_page.dart';
import '../widgets/pages/login/login_page.dart';
import '../widgets/tabs/more/more_page.dart';
import '../widgets/tabs/profiles/profiles_page.dart';
import '../widgets/tabs/recordings/recordings_page.dart';
import '../widgets/tabs/tasks/tasks_page.dart';

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
            children: [
              RedirectRoute(
                path: '',
                redirectTo: 'tasks',
              ),
              AutoRoute(
                path: 'tasks',
                page: TasksRoute.page,
              ),
              AutoRoute(
                path: 'recordings',
                page: RecordingsRoute.page,
              ),
              AutoRoute(
                path: 'profiles',
                page: ProfilesRoute.page,
              ),
              AutoRoute(
                path: 'more',
                page: MoreRoute.page,
              ),
            ],
          ),
        ],
      ),
    ];
  }
}
