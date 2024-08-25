import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../../../../constants.dart';
import '../../../../extensions/date_time.dart';
import '../../../../extensions/weekdays.dart';
import '../../../app_router/app_router.dart';
import '../../error_panel.dart';
import '../../extensions/app_bar_controller.dart';
import '../../extensions/fade_transition_builder.dart';
import '../../extensions/mouse_navigator.dart';
import '../../extensions/smooth_mouse_scroll/smooth_mouse_scroll.dart';
import '../../list_view_shimmer.dart';
import '../../lister/bloc/lister_bloc.dart';
import 'planned_tasks_bloc.dart';

@RoutePage()
class PlannedTasksPage extends StatelessWidget {
  const PlannedTasksPage({super.key});

  @override
  Widget build(final BuildContext context) {
    return MouseNavigator(
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (final _) => AppBarController()),
          BlocProvider(create: (final context) => PlannedTasksBloc()),
        ],
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Görev Planlama'),
          ),
          body: const _PlannedTasksList(),
          floatingActionButton: const _NewPlannedTaskButton(),
        ),
      ),
    );
  }
}

class _NewPlannedTaskButton extends StatelessWidget {
  const _NewPlannedTaskButton();

  @override
  Widget build(final BuildContext context) {
    return FloatingActionButton(
      onPressed: () => context.pushRoute(const NewTaskEditorRoute()),
      child: const Icon(Icons.add),
    );
  }
}

class _PlannedTasksList extends StatelessWidget {
  const _PlannedTasksList();

  @override
  Widget build(final BuildContext context) {
    late final PlannedTasksBloc bloc;
    var isInitialized = false;
    context.select((final PlannedTasksBloc newBloc) {
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
        ListerStateLoading() => const ListViewShimmer(),
        ListerStateData() => const _PlannedTasksListContent(),
        ListerStateError(
          :final error
        ) =>
          ErrorPanel(
            error: error,
            onRefresh: () => bloc.add(const ListerEventLoadRequested()),
          ),
      },
    );
  }
}

class _PlannedTasksListContent extends StatelessWidget {
  const _PlannedTasksListContent();

  @override
  Widget build(final BuildContext context) {
    final count = context.select((final PlannedTasksBloc bloc) {
      return switch (bloc.state) {
        ListerStateData(
          :final items
        ) =>
          items.length,
        _ => 0,
      };
    });

    return count == 0
        ? const Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.event_available,
                  size: 64,
                ),
                Text('No planned tasks'),
              ],
            ),
          )
        : SmoothMouseScroll(
            builder: (final context, final child, final controller, final physics) {
              return ListView.builder(
                controller: controller,
                physics: physics,
                itemBuilder: _Item.new,
                itemCount: count,
              );
            },
          );
  }
}

class _Item extends StatelessWidget {
  const _Item(final BuildContext _, this.index);

  final int index;

  @override
  Widget build(final BuildContext context) {
    final exists = context.select((final PlannedTasksBloc bloc) {
      return switch (bloc.state) {
        ListerStateData(
          :final items,
        ) =>
          items.length >= index,
        _ => false,
      };
    });

    return exists
        ? Card(
            child: _ItemContent(index),
          )
        : const SizedBox.shrink();
  }
}

String _formatTime(final Duration duration) {
  final minutes = duration.inHours.toString().padLeft(2, '0');
  final seconds = (duration.inMinutes % 60).toString().padLeft(2, '0');
  final time = '$minutes:$seconds';
  return time;
}

class _ItemContent extends StatelessWidget {
  const _ItemContent(this.index);

  final int index;

  @override
  Widget build(final BuildContext context) {
    late final PlannedTasksBloc bloc;
    var isInitialized = false;
    final plannedTask = context.select((final PlannedTasksBloc newBloc) {
      if (!isInitialized) {
        bloc = newBloc;
        isInitialized = true;
      }
      return switch (bloc.state) {
        ListerStateData(
          :final items,
        ) =>
          items.elementAtOrNull(index),
        _ => null,
      };
    });

    return plannedTask != null
        ? ListTile(
            title: Text(
              plannedTask.text,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            subtitle: Row(
              children: [
                if (plannedTask.isImageRequired)
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
                    _formatTime(plannedTask.deadline.toTime()),
                  ),
                ),
                if (isWeekdaySelected(0, plannedTask.weekdays)) _Day(day: 0, text: weekdayNames[0]),
                if (isWeekdaySelected(1, plannedTask.weekdays)) _Day(day: 1, text: weekdayNames[1]),
                if (isWeekdaySelected(2, plannedTask.weekdays)) _Day(day: 2, text: weekdayNames[2]),
                if (isWeekdaySelected(3, plannedTask.weekdays)) _Day(day: 3, text: weekdayNames[3]),
                if (isWeekdaySelected(4, plannedTask.weekdays)) _Day(day: 4, text: weekdayNames[4]),
                if (isWeekdaySelected(5, plannedTask.weekdays)) _Day(day: 5, text: weekdayNames[5]),
                if (isWeekdaySelected(6, plannedTask.weekdays)) _Day(day: 6, text: weekdayNames[6]),
              ],
            ),
            onTap: () => context.router.push(PlannedTaskEditorRoute(plannedTaskId: plannedTask.id, plannedTask: plannedTask)),
          )
        : const SizedBox.shrink();
  }
}

class _Day extends StatelessWidget {
  const _Day({
    required this.day,
    required this.text,
  });

  final int day;
  final String text;

  @override
  Widget build(final BuildContext context) {
    return Flexible(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 4),
        child: Ink(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.fromBorderSide(
              BorderSide(
                color: Theme.of(context).colorScheme.outlineVariant,
              ),
            ),
          ),
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              minHeight: 24,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
              child: FittedBox(
                child: Text(text),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
