import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../../api/entity/planned_task/planned_task.dart';
import '../../../../constants.dart';
import '../../../../extensions/date_time.dart';
import '../../../../extensions/duration.dart';
import '../../../../extensions/weekdays.dart';
import '../../../app_router/app_router.dart';
import '../../lister/lister_widget.dart';
import 'planned_tasks_bloc.dart';

@RoutePage()
class PlannedTasksPage extends StatelessWidget {
  const PlannedTasksPage({super.key});

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Görev Planlama')),
      body: const Lister<PlannedTasksBloc, PlannedTask>.cards(
        blocCreator: PlannedTasksBloc.new,
        itemContentBuilder: _Item.new,
        noItemsIcon: Icons.event_available,
        noItemsText: 'Görev bulunamadı',
      ),
      floatingActionButton: const _NewPlannedTaskButton(),
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

class _Item extends StatelessWidget {
  const _Item(this.plannedTask);

  final PlannedTask plannedTask;

  @override
  Widget build(final BuildContext context) {
    return ListTile(
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
              child: Icon(Icons.photo, size: 16),
            ),
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: Text(plannedTask.deadline.toTime().toMinutesAndSeconds()),
          ),
          if (isWeekdaySelected(0, plannedTask.weekdays))
            _Day(day: 0, text: weekdayNames[0]),
          if (isWeekdaySelected(1, plannedTask.weekdays))
            _Day(day: 1, text: weekdayNames[1]),
          if (isWeekdaySelected(2, plannedTask.weekdays))
            _Day(day: 2, text: weekdayNames[2]),
          if (isWeekdaySelected(3, plannedTask.weekdays))
            _Day(day: 3, text: weekdayNames[3]),
          if (isWeekdaySelected(4, plannedTask.weekdays))
            _Day(day: 4, text: weekdayNames[4]),
          if (isWeekdaySelected(5, plannedTask.weekdays))
            _Day(day: 5, text: weekdayNames[5]),
          if (isWeekdaySelected(6, plannedTask.weekdays))
            _Day(day: 6, text: weekdayNames[6]),
        ],
      ),
      onTap:
          () => context.router.push(
            PlannedTaskEditorRoute(
              plannedTaskId: plannedTask.id,
              plannedTask: plannedTask,
            ),
          ),
    );
  }
}

class _Day extends StatelessWidget {
  const _Day({required this.day, required this.text});

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
              BorderSide(color: Theme.of(context).colorScheme.outlineVariant),
            ),
          ),
          child: ConstrainedBox(
            constraints: const BoxConstraints(minHeight: 24),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
              child: FittedBox(child: Text(text)),
            ),
          ),
        ),
      ),
    );
  }
}
