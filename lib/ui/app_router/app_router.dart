import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';

import '../../api/entity/planned_task/planned_task.dart';
import '../../api/entity/profile/profile.dart';
import '../../api/entity/recording/recording.dart';
import '../../api/entity/rule/rule.dart';
import '../../api/entity/task/task.dart';
import '../../api/entity/violation/violation.dart';
import '../widgets/dialogs/task_viewer/task_viewer_dialog.dart';
import '../widgets/dialogs/violation_viewer/violation_viewer_dialog.dart';
import '../widgets/extensions/dialog_router.dart';
import '../widgets/pages/app/app_page.dart';
import '../widgets/pages/home/home_page.dart';
import '../widgets/pages/login/login_page.dart';
import '../widgets/pages/player/player_page.dart';
import '../widgets/pages/profile_editor/profile_editor_page.dart';
import '../widgets/pages/rule_editor/rule_editor_page.dart';
import '../widgets/pages/task_editor/task_editor_page.dart';
import '../widgets/pages/violations/violations_page.dart';
import '../widgets/tabs/more/more_page.dart';
import '../widgets/tabs/planned_tasks/planned_tasks_page.dart';
import '../widgets/tabs/profiles/profiles_page.dart';
import '../widgets/tabs/recordings/recordings_page.dart';
import '../widgets/tabs/rules/rules_page.dart';
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
                redirectTo: 'home',
              ),
              CupertinoRoute(
                path: 'home',
                page: FirstTabRoute.page,
                children: [
                  CupertinoRoute(
                    path: '',
                    page: ViolationsRoute.page,
                    children: [
                      DialogRoute(
                        path: ':id',
                        page: ViolationViewerRoute.page,
                      ),
                    ],
                  ),
                ],
              ),
              CupertinoRoute(
                path: 'recordings',
                page: SecondTabRoute.page,
                children: [
                  CupertinoRoute(path: '', page: RecordingsRoute.page),
                  CupertinoRoute(
                    path: ':recordingId/line/:textLineId',
                    page: PlayerRoute.page,
                  ),
                  CupertinoRoute(
                    path: ':id/violations',
                    page: ViolationsRoute.page,
                    children: [
                      DialogRoute(
                        path: ':id',
                        page: ViolationViewerRoute.page,
                      ),
                    ],
                  ),
                ],
              ),
              CupertinoRoute(
                path: 'tasks',
                page: ThirdTabRoute.page,
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
                    path: 'new',
                    page: NewTaskEditorRoute.page,
                  ),
                  CupertinoRoute(
                    path: ':taskId/edit',
                    page: TaskEditorRoute.page,
                  ),
                  CupertinoRoute(
                    path: 'planned',
                    page: PlannedTasksRoute.page,
                  ),
                  CupertinoRoute(
                    path: 'planned/:plannedTaskId',
                    page: PlannedTaskEditorRoute.page,
                  ),
                ],
              ),
              CupertinoRoute(
                path: 'more',
                page: FourthTabRoute.page,
                children: [
                  CupertinoRoute(path: '', page: MoreRoute.page),
                  CupertinoRoute(
                    path: 'profiles',
                    page: ProfilesRoute.page,
                  ),
                  CupertinoRoute(
                    path: ':uid',
                    page: ProfileEditorRoute.page,
                  ),
                  CupertinoRoute(
                    path: 'new',
                    page: NewProfileEditorRoute.page,
                  ),
                  CupertinoRoute(
                    path: 'rules',
                    page: RulesRoute.page,
                  ),
                  CupertinoRoute(
                    path: 'rules/:id',
                    page: RuleEditorRoute.page,
                  ),
                  CupertinoRoute(
                    path: 'rules/new',
                    page: NewRuleEditorRoute.page,
                  ),
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
class FourthTabPage extends AutoRouter {
  const FourthTabPage({super.key});
}
