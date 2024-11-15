// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

/// generated route for
/// [AppPage]
class AppRoute extends PageRouteInfo<void> {
  const AppRoute({List<PageRouteInfo>? children})
      : super(
          AppRoute.name,
          initialChildren: children,
        );

  static const String name = 'AppRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const AppPage();
    },
  );
}

/// generated route for
/// [FirstTabPage]
class FirstTabRoute extends PageRouteInfo<void> {
  const FirstTabRoute({List<PageRouteInfo>? children})
      : super(
          FirstTabRoute.name,
          initialChildren: children,
        );

  static const String name = 'FirstTabRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const FirstTabPage();
    },
  );
}

/// generated route for
/// [FourthTabPage]
class FourthTabRoute extends PageRouteInfo<void> {
  const FourthTabRoute({List<PageRouteInfo>? children})
      : super(
          FourthTabRoute.name,
          initialChildren: children,
        );

  static const String name = 'FourthTabRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const FourthTabPage();
    },
  );
}

/// generated route for
/// [HomePage]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const HomePage();
    },
  );
}

/// generated route for
/// [LoginPage]
class LoginRoute extends PageRouteInfo<void> {
  const LoginRoute({List<PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const LoginPage();
    },
  );
}

/// generated route for
/// [MorePage]
class MoreRoute extends PageRouteInfo<void> {
  const MoreRoute({List<PageRouteInfo>? children})
      : super(
          MoreRoute.name,
          initialChildren: children,
        );

  static const String name = 'MoreRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const MorePage();
    },
  );
}

/// generated route for
/// [NewProfileEditorPage]
class NewProfileEditorRoute extends PageRouteInfo<void> {
  const NewProfileEditorRoute({List<PageRouteInfo>? children})
      : super(
          NewProfileEditorRoute.name,
          initialChildren: children,
        );

  static const String name = 'NewProfileEditorRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const NewProfileEditorPage();
    },
  );
}

/// generated route for
/// [NewRuleEditorPage]
class NewRuleEditorRoute extends PageRouteInfo<void> {
  const NewRuleEditorRoute({List<PageRouteInfo>? children})
      : super(
          NewRuleEditorRoute.name,
          initialChildren: children,
        );

  static const String name = 'NewRuleEditorRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const NewRuleEditorPage();
    },
  );
}

/// generated route for
/// [NewTaskEditorPage]
class NewTaskEditorRoute extends PageRouteInfo<void> {
  const NewTaskEditorRoute({List<PageRouteInfo>? children})
      : super(
          NewTaskEditorRoute.name,
          initialChildren: children,
        );

  static const String name = 'NewTaskEditorRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const NewTaskEditorPage();
    },
  );
}

/// generated route for
/// [PlannedTaskEditorPage]
class PlannedTaskEditorRoute extends PageRouteInfo<PlannedTaskEditorRouteArgs> {
  PlannedTaskEditorRoute({
    required int plannedTaskId,
    PlannedTask? plannedTask,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          PlannedTaskEditorRoute.name,
          args: PlannedTaskEditorRouteArgs(
            plannedTaskId: plannedTaskId,
            plannedTask: plannedTask,
            key: key,
          ),
          rawPathParams: {'plannedTaskId': plannedTaskId},
          initialChildren: children,
        );

  static const String name = 'PlannedTaskEditorRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final pathParams = data.inheritedPathParams;
      final args = data.argsAs<PlannedTaskEditorRouteArgs>(
          orElse: () => PlannedTaskEditorRouteArgs(
              plannedTaskId: pathParams.getInt('plannedTaskId')));
      return PlannedTaskEditorPage(
        plannedTaskId: args.plannedTaskId,
        plannedTask: args.plannedTask,
        key: args.key,
      );
    },
  );
}

class PlannedTaskEditorRouteArgs {
  const PlannedTaskEditorRouteArgs({
    required this.plannedTaskId,
    this.plannedTask,
    this.key,
  });

  final int plannedTaskId;

  final PlannedTask? plannedTask;

  final Key? key;

  @override
  String toString() {
    return 'PlannedTaskEditorRouteArgs{plannedTaskId: $plannedTaskId, plannedTask: $plannedTask, key: $key}';
  }
}

/// generated route for
/// [PlannedTasksPage]
class PlannedTasksRoute extends PageRouteInfo<void> {
  const PlannedTasksRoute({List<PageRouteInfo>? children})
      : super(
          PlannedTasksRoute.name,
          initialChildren: children,
        );

  static const String name = 'PlannedTasksRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const PlannedTasksPage();
    },
  );
}

/// generated route for
/// [PlayerPage]
class PlayerRoute extends PageRouteInfo<PlayerRouteArgs> {
  PlayerRoute({
    required int recordingId,
    int? textLineId,
    Recording? recording,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          PlayerRoute.name,
          args: PlayerRouteArgs(
            recordingId: recordingId,
            textLineId: textLineId,
            recording: recording,
            key: key,
          ),
          rawPathParams: {
            'recordingId': recordingId,
            'textLineId': textLineId,
          },
          initialChildren: children,
        );

  static const String name = 'PlayerRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final pathParams = data.inheritedPathParams;
      final args = data.argsAs<PlayerRouteArgs>(
          orElse: () => PlayerRouteArgs(
                recordingId: pathParams.getInt('recordingId'),
                textLineId: pathParams.optInt('textLineId'),
              ));
      return PlayerPage(
        recordingId: args.recordingId,
        textLineId: args.textLineId,
        recording: args.recording,
        key: args.key,
      );
    },
  );
}

class PlayerRouteArgs {
  const PlayerRouteArgs({
    required this.recordingId,
    this.textLineId,
    this.recording,
    this.key,
  });

  final int recordingId;

  final int? textLineId;

  final Recording? recording;

  final Key? key;

  @override
  String toString() {
    return 'PlayerRouteArgs{recordingId: $recordingId, textLineId: $textLineId, recording: $recording, key: $key}';
  }
}

/// generated route for
/// [ProfileEditorPage]
class ProfileEditorRoute extends PageRouteInfo<ProfileEditorRouteArgs> {
  ProfileEditorRoute({
    required String uid,
    Profile? profile,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          ProfileEditorRoute.name,
          args: ProfileEditorRouteArgs(
            uid: uid,
            profile: profile,
            key: key,
          ),
          rawPathParams: {'uid': uid},
          initialChildren: children,
        );

  static const String name = 'ProfileEditorRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final pathParams = data.inheritedPathParams;
      final args = data.argsAs<ProfileEditorRouteArgs>(
          orElse: () =>
              ProfileEditorRouteArgs(uid: pathParams.getString('uid')));
      return ProfileEditorPage(
        uid: args.uid,
        profile: args.profile,
        key: args.key,
      );
    },
  );
}

class ProfileEditorRouteArgs {
  const ProfileEditorRouteArgs({
    required this.uid,
    this.profile,
    this.key,
  });

  final String uid;

  final Profile? profile;

  final Key? key;

  @override
  String toString() {
    return 'ProfileEditorRouteArgs{uid: $uid, profile: $profile, key: $key}';
  }
}

/// generated route for
/// [ProfilesPage]
class ProfilesRoute extends PageRouteInfo<void> {
  const ProfilesRoute({List<PageRouteInfo>? children})
      : super(
          ProfilesRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfilesRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ProfilesPage();
    },
  );
}

/// generated route for
/// [RecordingsPage]
class RecordingsRoute extends PageRouteInfo<void> {
  const RecordingsRoute({List<PageRouteInfo>? children})
      : super(
          RecordingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'RecordingsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const RecordingsPage();
    },
  );
}

/// generated route for
/// [RuleEditorPage]
class RuleEditorRoute extends PageRouteInfo<RuleEditorRouteArgs> {
  RuleEditorRoute({
    required int id,
    Rule? rule,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          RuleEditorRoute.name,
          args: RuleEditorRouteArgs(
            id: id,
            rule: rule,
            key: key,
          ),
          rawPathParams: {'id': id},
          initialChildren: children,
        );

  static const String name = 'RuleEditorRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final pathParams = data.inheritedPathParams;
      final args = data.argsAs<RuleEditorRouteArgs>(
          orElse: () => RuleEditorRouteArgs(id: pathParams.getInt('id')));
      return RuleEditorPage(
        id: args.id,
        rule: args.rule,
        key: args.key,
      );
    },
  );
}

class RuleEditorRouteArgs {
  const RuleEditorRouteArgs({
    required this.id,
    this.rule,
    this.key,
  });

  final int id;

  final Rule? rule;

  final Key? key;

  @override
  String toString() {
    return 'RuleEditorRouteArgs{id: $id, rule: $rule, key: $key}';
  }
}

/// generated route for
/// [RulesPage]
class RulesRoute extends PageRouteInfo<void> {
  const RulesRoute({List<PageRouteInfo>? children})
      : super(
          RulesRoute.name,
          initialChildren: children,
        );

  static const String name = 'RulesRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const RulesPage();
    },
  );
}

/// generated route for
/// [SecondTabPage]
class SecondTabRoute extends PageRouteInfo<void> {
  const SecondTabRoute({List<PageRouteInfo>? children})
      : super(
          SecondTabRoute.name,
          initialChildren: children,
        );

  static const String name = 'SecondTabRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const SecondTabPage();
    },
  );
}

/// generated route for
/// [TaskEditorPage]
class TaskEditorRoute extends PageRouteInfo<TaskEditorRouteArgs> {
  TaskEditorRoute({
    required int taskId,
    Task? task,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          TaskEditorRoute.name,
          args: TaskEditorRouteArgs(
            taskId: taskId,
            task: task,
            key: key,
          ),
          rawPathParams: {'taskId': taskId},
          initialChildren: children,
        );

  static const String name = 'TaskEditorRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final pathParams = data.inheritedPathParams;
      final args = data.argsAs<TaskEditorRouteArgs>(
          orElse: () =>
              TaskEditorRouteArgs(taskId: pathParams.getInt('taskId')));
      return TaskEditorPage(
        taskId: args.taskId,
        task: args.task,
        key: args.key,
      );
    },
  );
}

class TaskEditorRouteArgs {
  const TaskEditorRouteArgs({
    required this.taskId,
    this.task,
    this.key,
  });

  final int taskId;

  final Task? task;

  final Key? key;

  @override
  String toString() {
    return 'TaskEditorRouteArgs{taskId: $taskId, task: $task, key: $key}';
  }
}

/// generated route for
/// [TaskViewerDialog]
class TaskViewerRoute extends PageRouteInfo<TaskViewerRouteArgs> {
  TaskViewerRoute({
    required int id,
    Task? task,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          TaskViewerRoute.name,
          args: TaskViewerRouteArgs(
            id: id,
            task: task,
            key: key,
          ),
          rawPathParams: {'id': id},
          initialChildren: children,
        );

  static const String name = 'TaskViewerRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final pathParams = data.inheritedPathParams;
      final args = data.argsAs<TaskViewerRouteArgs>(
          orElse: () => TaskViewerRouteArgs(id: pathParams.getInt('id')));
      return TaskViewerDialog(
        id: args.id,
        task: args.task,
        key: args.key,
      );
    },
  );
}

class TaskViewerRouteArgs {
  const TaskViewerRouteArgs({
    required this.id,
    this.task,
    this.key,
  });

  final int id;

  final Task? task;

  final Key? key;

  @override
  String toString() {
    return 'TaskViewerRouteArgs{id: $id, task: $task, key: $key}';
  }
}

/// generated route for
/// [TasksPage]
class TasksRoute extends PageRouteInfo<void> {
  const TasksRoute({List<PageRouteInfo>? children})
      : super(
          TasksRoute.name,
          initialChildren: children,
        );

  static const String name = 'TasksRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const TasksPage();
    },
  );
}

/// generated route for
/// [ThirdTabPage]
class ThirdTabRoute extends PageRouteInfo<void> {
  const ThirdTabRoute({List<PageRouteInfo>? children})
      : super(
          ThirdTabRoute.name,
          initialChildren: children,
        );

  static const String name = 'ThirdTabRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ThirdTabPage();
    },
  );
}

/// generated route for
/// [ViolationViewerDialog]
class ViolationViewerRoute extends PageRouteInfo<ViolationViewerRouteArgs> {
  ViolationViewerRoute({
    required int id,
    Violation? violation,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          ViolationViewerRoute.name,
          args: ViolationViewerRouteArgs(
            id: id,
            violation: violation,
            key: key,
          ),
          rawPathParams: {'id': id},
          initialChildren: children,
        );

  static const String name = 'ViolationViewerRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final pathParams = data.inheritedPathParams;
      final args = data.argsAs<ViolationViewerRouteArgs>(
          orElse: () => ViolationViewerRouteArgs(id: pathParams.getInt('id')));
      return ViolationViewerDialog(
        id: args.id,
        violation: args.violation,
        key: args.key,
      );
    },
  );
}

class ViolationViewerRouteArgs {
  const ViolationViewerRouteArgs({
    required this.id,
    this.violation,
    this.key,
  });

  final int id;

  final Violation? violation;

  final Key? key;

  @override
  String toString() {
    return 'ViolationViewerRouteArgs{id: $id, violation: $violation, key: $key}';
  }
}

/// generated route for
/// [ViolationsPage]
class ViolationsRoute extends PageRouteInfo<ViolationsRouteArgs> {
  ViolationsRoute({
    int? id,
    List<Violation>? violations,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          ViolationsRoute.name,
          args: ViolationsRouteArgs(
            id: id,
            violations: violations,
            key: key,
          ),
          rawPathParams: {'id': id},
          initialChildren: children,
        );

  static const String name = 'ViolationsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final pathParams = data.inheritedPathParams;
      final args = data.argsAs<ViolationsRouteArgs>(
          orElse: () => ViolationsRouteArgs(id: pathParams.optInt('id')));
      return ViolationsPage(
        id: args.id,
        violations: args.violations,
        key: args.key,
      );
    },
  );
}

class ViolationsRouteArgs {
  const ViolationsRouteArgs({
    this.id,
    this.violations,
    this.key,
  });

  final int? id;

  final List<Violation>? violations;

  final Key? key;

  @override
  String toString() {
    return 'ViolationsRouteArgs{id: $id, violations: $violations, key: $key}';
  }
}
