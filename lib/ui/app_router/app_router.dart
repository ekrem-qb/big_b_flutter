import 'package:auto_route/auto_route.dart';

import '../widgets/pages/app/app_page.dart';
import '../widgets/pages/home/home_page.dart';
import '../widgets/pages/login/login_page.dart';
import '../widgets/tabs/more/more_page.dart';
import '../widgets/tabs/planned_tasks/planned_tasks_page.dart';
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
                page: FirstTabRoute.page,
                children: [
                  AutoRoute(path: '', page: TasksRoute.page),
                  AutoRoute(
                    path: 'planned_tasks',
                    page: PlannedTasksRoute.page,
                  ),
                ],
              ),
              AutoRoute(
                path: 'recordings',
                page: SecondTabRoute.page,
                children: [
                  AutoRoute(path: '', page: RecordingsRoute.page),
                ],
              ),
              AutoRoute(
                path: 'profiles',
                page: ThirdTabRoute.page,
                children: [
                  AutoRoute(path: '', page: ProfilesRoute.page),
                ],
              ),
              AutoRoute(
                path: 'more',
                page: ForthTabRoute.page,
                children: [
                  AutoRoute(path: '', page: MoreRoute.page),
                ],
              ),
            ],
          ),
        ],
      ),
    ];
  }
}

@RoutePage()
class FirstTabPage extends AutoRouter {
  const FirstTabPage({super.key});
}

@RoutePage()
class SecondTabPage extends AutoRouter {
  const SecondTabPage({super.key});
}

@RoutePage()
class ThirdTabPage extends AutoRouter {
  const ThirdTabPage({super.key});
}

@RoutePage()
class ForthTabPage extends AutoRouter {
  const ForthTabPage({super.key});
}
