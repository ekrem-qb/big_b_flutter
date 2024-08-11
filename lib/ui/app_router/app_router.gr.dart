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
/// [ForthTabPage]
class ForthTabRoute extends PageRouteInfo<void> {
  const ForthTabRoute({List<PageRouteInfo>? children})
      : super(
          ForthTabRoute.name,
          initialChildren: children,
        );

  static const String name = 'ForthTabRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ForthTabPage();
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
    required int id,
    Recording? recording,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          PlayerRoute.name,
          args: PlayerRouteArgs(
            id: id,
            recording: recording,
            key: key,
          ),
          rawPathParams: {'id': id},
          initialChildren: children,
        );

  static const String name = 'PlayerRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final pathParams = data.inheritedPathParams;
      final args = data.argsAs<PlayerRouteArgs>(
          orElse: () => PlayerRouteArgs(id: pathParams.getInt('id')));
      return PlayerPage(
        id: args.id,
        recording: args.recording,
        key: args.key,
      );
    },
  );
}

class PlayerRouteArgs {
  const PlayerRouteArgs({
    required this.id,
    this.recording,
    this.key,
  });

  final int id;

  final Recording? recording;

  final Key? key;

  @override
  String toString() {
    return 'PlayerRouteArgs{id: $id, recording: $recording, key: $key}';
  }
}

/// generated route for
/// [ProfileEditorPage]
class ProfileEditorRoute extends PageRouteInfo<ProfileEditorRouteArgs> {
  ProfileEditorRoute({
    String? uid,
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
              ProfileEditorRouteArgs(uid: pathParams.optString('uid')));
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
    this.uid,
    this.profile,
    this.key,
  });

  final String? uid;

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
