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
