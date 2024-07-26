import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../constants.dart';
import '../../../../extensions/date_time.dart';
import '../../../../extensions/weekdays.dart';
import '../../extensions/smooth_scroll/smooth_scroll_widget.dart';
import 'planned_tasks_model.dart';

class PlannedTasksPage extends StatelessWidget {
  const PlannedTasksPage({super.key});

  @override
  Widget build(final BuildContext context) {
    return ChangeNotifierProvider(
      create: PlannedTasks.new,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Görev Planlama'),
        ),
        body: const _PlannedTasksList(),
        floatingActionButton: const _NewPlannedTaskButton(),
      ),
    );
  }
}

class _NewPlannedTaskButton extends StatelessWidget {
  const _NewPlannedTaskButton();

  @override
  Widget build(final BuildContext context) {
    final model = context.read<PlannedTasks>();

    return FloatingActionButton(
      onPressed: model.newPlannedTask,
      child: const Icon(Icons.add),
    );
  }
}

class _PlannedTasksList extends StatelessWidget {
  const _PlannedTasksList();

  @override
  Widget build(final BuildContext context) {
    late final PlannedTasks model;
    var isInitialized = false;
    context.select((final PlannedTasks newModel) {
      if (!isInitialized) {
        model = newModel;
        isInitialized = true;
      }
      return model.isLoading;
    });

    return model.isLoading
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : const _PlannedTasksListContent();
  }
}

class _PlannedTasksListContent extends StatelessWidget {
  const _PlannedTasksListContent();

  @override
  Widget build(final BuildContext context) {
    late final PlannedTasks model;
    var isInitialized = false;
    context.select((final PlannedTasks newModel) {
      if (!isInitialized) {
        model = newModel;
        isInitialized = true;
      }
      return model.plannedTasks.length;
    });

    return model.plannedTasks.isEmpty
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
        : isDesktop
            ? SmoothScroll(
                controller: model.scrollController,
                child: ListView.builder(
                  controller: model.scrollController,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: _Item.new,
                  itemCount: model.plannedTasks.length,
                ),
              )
            : ListView.builder(
                controller: model.scrollController,
                itemBuilder: _Item.new,
                itemCount: model.plannedTasks.length,
              );
  }
}

class _Item extends StatelessWidget {
  const _Item(final BuildContext _, this.index);

  final int index;

  @override
  Widget build(final BuildContext context) {
    return Card(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
      ),
      child: _ItemContent(index),
    );
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
    late final PlannedTasks model;
    var isInitialized = false;
    context.select((final PlannedTasks newModel) {
      if (!isInitialized) {
        model = newModel;
        isInitialized = true;
      }
      return model.plannedTasks.elementAtOrNull(index);
    });

    return model.plannedTasks.length >= index
        ? ListTile(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(12),
              ),
            ),
            title: Text(
              model.plannedTasks[index].text,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            subtitle: Row(
              children: [
                if (model.plannedTasks[index].isImageRequired)
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
                    _formatTime(model.plannedTasks[index].deadline.toTime()),
                  ),
                ),
                if (isWeekdaySelected(0, model.plannedTasks[index].weekdays)) _Day(day: 0, text: weekdayNames[0]),
                if (isWeekdaySelected(1, model.plannedTasks[index].weekdays)) _Day(day: 1, text: weekdayNames[1]),
                if (isWeekdaySelected(2, model.plannedTasks[index].weekdays)) _Day(day: 2, text: weekdayNames[2]),
                if (isWeekdaySelected(3, model.plannedTasks[index].weekdays)) _Day(day: 3, text: weekdayNames[3]),
                if (isWeekdaySelected(4, model.plannedTasks[index].weekdays)) _Day(day: 4, text: weekdayNames[4]),
                if (isWeekdaySelected(5, model.plannedTasks[index].weekdays)) _Day(day: 5, text: weekdayNames[5]),
                if (isWeekdaySelected(6, model.plannedTasks[index].weekdays)) _Day(day: 6, text: weekdayNames[6]),
              ],
            ),
            onTap: () => model.open(index),
          )
        : const _DeletedItemContent();
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
