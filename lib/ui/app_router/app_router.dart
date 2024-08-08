import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';

import '../../api/entity/task/task.dart';
import '../widgets/dialogs/task_viewer/task_viewer_dialog.dart';
import '../widgets/extensions/dialog_router.dart';
import '../widgets/pages/app/app_page.dart';
import '../widgets/pages/home/home_page.dart';
import '../widgets/pages/login/login_page.dart';
import '../widgets/tabs/more/more_page.dart';
import '../widgets/tabs/planned_tasks/planned_tasks_page.dart';
import '../widgets/tabs/profiles/profiles_page.dart';
import '../widgets/tabs/recordings/recordings_page.dart';
import '../widgets/tabs/tasks/tasks_page.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page|Screen|Dialog,Route')
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes {
    return [
      CupertinoRoute(
        path: '/',
        page: AppRoute.page,
        initial: true,
        children: [
          CupertinoRoute(
            path: 'login',
            page: LoginRoute.page,
          ),
          CupertinoRoute(
            path: 'home',
            page: HomeRoute.page,
            children: [
              RedirectRoute(
                path: '',
                redirectTo: 'tasks',
              ),
              CupertinoRoute(
                path: 'tasks',
                page: FirstTabRoute.page,
                children: [
                  CupertinoRoute(
                    path: '',
                    page: TasksRoute.page,
                    children: [
                      DialogRoute(
                        path: ':id/view',
                        page: TaskViewerRoute.page,
                      ),
                    ],
                  ),
                  CupertinoRoute(
                    path: 'planned',
                    page: PlannedTasksRoute.page,
                  ),
                ],
              ),
              CupertinoRoute(
                path: 'recordings',
                page: SecondTabRoute.page,
                children: [
                  CupertinoRoute(path: '', page: RecordingsRoute.page),
                ],
              ),
              CupertinoRoute(
                path: 'profiles',
                page: ThirdTabRoute.page,
                children: [
                  CupertinoRoute(path: '', page: ProfilesRoute.page),
                ],
              ),
              CupertinoRoute(
                path: 'more',
                page: ForthTabRoute.page,
                children: [
                  CupertinoRoute(path: '', page: MoreRoute.page),
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
