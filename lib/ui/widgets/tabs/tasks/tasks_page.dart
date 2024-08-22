import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../../../app_router/app_router.dart';
import '../../../theme.dart';
import '../../error_panel.dart';
import '../../extensions/app_bar_controller.dart';
import '../../extensions/dialog_router.dart';
import '../../extensions/fade_transition_builder.dart';
import '../../extensions/smooth_mouse_scroll/smooth_mouse_scroll.dart';
import '../../list_view_shimmer.dart';
import 'bloc/tasks_bloc.dart';

@RoutePage()
class TasksPage extends StatelessWidget {
  const TasksPage({super.key});

  @override
  Widget build(final BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (final _) => AppBarController()),
        BlocProvider(create: (final context) => TasksBloc()),
      ],
      child: const Stack(
        children: [
          _Scaffold(),
          DialogRouter(),
        ],
      ),
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
        shadowColor: Theme.of(context).shadowColor,
        title: const Text('Görevler'),
        notificationPredicate: appBar.onScroll,
        actions: const [
          _PlanningButton(),
          SizedBox(width: 8),
        ],
      ),
      body: const _TasksList(),
      floatingActionButton: const _NewTaskButton(),
    );
  }
}

class _PlanningButton extends StatelessWidget {
  const _PlanningButton();

  @override
  Widget build(final BuildContext context) {
    late final AppBarController appBar;
    var isInitialized = false;
    context.select((final AppBarController newBloc) {
      if (!isInitialized) {
        appBar = newBloc;
        isInitialized = true;
      }
      return appBar.isScrolled;
    });

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

class _TasksList extends StatelessWidget {
  const _TasksList();

  @override
  Widget build(final BuildContext context) {
    late final TasksBloc bloc;
    var isInitialized = false;
    context.select((final TasksBloc newBloc) {
      if (!isInitialized) {
        bloc = newBloc;
        isInitialized = true;
      }
      return bloc.state.runtimeType;
    });

    return AnimatedSwitcher(
      duration: Durations.medium1,
      transitionBuilder: fadeTransitionBuilder,
      child: switch (bloc.state) {
        TasksStateLoading() => const ListViewShimmer(),
        TasksStateData() => const _TasksListContent(),
        TasksStateError(
          :final error
        ) =>
          ErrorPanel(
            error: error,
            onRefresh: () => bloc.add(const TasksEventLoadRequested()),
          ),
      },
    );
  }
}

class _TasksListContent extends StatelessWidget {
  const _TasksListContent();

  @override
  Widget build(final BuildContext context) {
    final count = context.select((final TasksBloc bloc) {
      return switch (bloc.state) {
        TasksStateData(
          :final tasks
        ) =>
          tasks.length,
        _ => 0,
      };
    });

    return count == 0
        ? const Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.sentiment_very_dissatisfied,
                  size: 64,
                ),
                Text('No tasks'),
              ],
            ),
          )
        : SmoothMouseScroll(
            builder: (final context, final child, final controller, final physics) {
              return ListView.builder(
                controller: controller,
                physics: physics,
                itemBuilder: _ItemCard.new,
                itemCount: count,
              );
            },
          );
  }
}

class _ItemCard extends StatelessWidget {
  const _ItemCard(final BuildContext _, this.index);

  final int index;

  @override
  Widget build(final BuildContext context) {
    return Card(
      child: _Item(index),
    );
  }
}

class _Item extends StatelessWidget {
  const _Item(this.index);

  final int index;

  @override
  Widget build(final BuildContext context) {
    final exists = context.select((final TasksBloc bloc) {
      return switch (bloc.state) {
        TasksStateData(
          :final tasks,
        ) =>
          tasks.length >= index,
        _ => false,
      };
    });

    return exists ? _ItemContent(index) : const _DeletedItemContent();
  }
}

void _open(final int index, final BuildContext context, final TasksBloc bloc) {
  final state = bloc.state;
  if (state is! TasksStateData) return;
  if (state.tasks.length < index) return;

  context.router.push(TaskViewerRoute(id: state.tasks[index].id, task: state.tasks[index]));
}

class _ItemContent extends StatelessWidget {
  const _ItemContent(this.index);

  final int index;

  @override
  Widget build(final BuildContext context) {
    late final TasksBloc bloc;
    var isInitialized = false;
    final isDone = context.select((final TasksBloc newBloc) {
      if (!isInitialized) {
        bloc = newBloc;
        isInitialized = true;
      }
      return switch (bloc.state) {
        TasksStateData(
          :final tasks,
        ) =>
          tasks.elementAtOrNull(index)?.isDone ?? false,
        _ => false,
      };
    });

    return isDone
        ? InkWell(
            borderRadius: kDefaultRadius,
            child: _ItemTile(index),
            onTap: () => _open(index, context, bloc),
          )
        : _ItemTile(index);
  }
}

class _ItemTile extends StatelessWidget {
  const _ItemTile(this.index);

  final int index;

  @override
  Widget build(final BuildContext context) {
    late final TasksBloc bloc;
    var isInitialized = false;
    final task = context.select((final TasksBloc newBloc) {
      if (!isInitialized) {
        bloc = newBloc;
        isInitialized = true;
      }
      return switch (bloc.state) {
        TasksStateData(
          :final tasks,
        ) =>
          tasks.elementAtOrNull(index),
        _ => null,
      };
    });

    return ListTile(
      mouseCursor: SystemMouseCursors.click,
      enabled: !(task?.isDone ?? false),
      leading: task?.isDone ?? false
          ? const Icon(
              Icons.check_circle,
            )
          : const Icon(
              Icons.circle_outlined,
            ),
      title: Text(
        task?.text ?? '',
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: task?.isDone ?? false
            ? const TextStyle(
                decoration: TextDecoration.lineThrough,
              )
            : null,
      ),
      subtitle: Row(
        children: [
          if (task?.imageUrl != null)
            const Padding(
              padding: EdgeInsets.only(right: 8),
              child: Icon(
                Icons.photo,
                size: 16,
              ),
            ),
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: Text(
              task?.deadline.toString() ?? '',
            ),
          ),
        ],
      ),
      onTap: () => _open(index, context, bloc),
    );
  }
}

class _DeletedItemContent extends StatelessWidget {
  const _DeletedItemContent();

  @override
  Widget build(final BuildContext context) {
    return const ListTile(
      mouseCursor: SystemMouseCursors.click,
      title: Text(
        'Silinmiş',
        style: TextStyle(color: Colors.red),
      ),
    );
  }
}
