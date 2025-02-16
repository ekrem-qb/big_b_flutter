import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../api/entity/task/task.dart';
import '../../../app_router/app_router.dart';
import '../../../theme.dart';
import '../../extensions/app_bar_controller.dart';
import '../../extensions/dialog_router.dart';
import '../../lister/lister_widget.dart';
import 'tasks_bloc.dart';

@RoutePage()
class TasksPage extends StatelessWidget {
  const TasksPage({super.key});

  @override
  Widget build(final BuildContext context) {
    return ChangeNotifierProvider(
      create: (final _) => AppBarController(),
      child: const Stack(children: [_Scaffold(), DialogRouter()]),
    );
  }
}

class _Scaffold extends StatelessWidget {
  const _Scaffold();

  @override
  Widget build(final BuildContext context) {
    final appBar = context.read<AppBarController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Görevler'),
        notificationPredicate: appBar.onScroll,
        actions: const [_PlanningButton(), SizedBox(width: 8)],
      ),
      body: const Lister<TasksBloc, Task>.cards(
        blocCreator: TasksBloc.new,
        itemContentBuilder: _Item.new,
        noItemsIcon: Icons.task_alt,
        noItemsText: 'Görev bulunamadı',
      ),
      floatingActionButton: const _NewTaskButton(),
    );
  }
}

class _PlanningButton extends StatelessWidget {
  const _PlanningButton();

  @override
  Widget build(final BuildContext context) {
    final (appBar, isScrolled) = context.select(
      (final AppBarController appBar) => (appBar, appBar.isScrolled),
    );

    return ElevatedButton.icon(
      style: ButtonStyle(
        visualDensity: VisualDensity.standard,
        elevation: appBar.isScrolled ? const WidgetStatePropertyAll(0) : null,
      ),
      icon: const Icon(Icons.event_available),
      label: const Text('Planlama'),
      onPressed: () => context.router.push(const PlannedTasksRoute()),
    );
  }
}

class _NewTaskButton extends StatelessWidget {
  const _NewTaskButton();

  @override
  Widget build(final BuildContext context) {
    return FloatingActionButton(
      onPressed: () => context.pushRoute(const NewTaskEditorRoute()),
      child: const Icon(Icons.add),
    );
  }
}

class _Item extends StatelessWidget {
  const _Item(this.task);

  final Task task;

  @override
  Widget build(final BuildContext context) {
    return task.isDone
        ? InkWell(
          borderRadius: kDefaultRadius,
          child: _ItemContent(task),
          onTap:
              () =>
                  context.router.push(TaskViewerRoute(id: task.id, task: task)),
        )
        : _ItemContent(task);
  }
}

class _ItemContent extends StatelessWidget {
  const _ItemContent(this.task);

  final Task task;

  @override
  Widget build(final BuildContext context) {
    return ListTile(
      mouseCursor: SystemMouseCursors.click,
      enabled: !task.isDone,
      leading:
          task.isDone
              ? const Icon(Icons.check_circle)
              : const Icon(Icons.circle_outlined),
      title: Text(
        task.text,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style:
            task.isDone
                ? const TextStyle(decoration: TextDecoration.lineThrough)
                : null,
      ),
      subtitle: Row(
        children: [
          if (task.imageUrl != null)
            const Padding(
              padding: EdgeInsets.only(right: 8),
              child: Icon(Icons.photo, size: 16),
            ),
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: Text(task.deadline.toString()),
          ),
        ],
      ),
      onTap:
          () => context.router.push(TaskViewerRoute(id: task.id, task: task)),
    );
  }
}
