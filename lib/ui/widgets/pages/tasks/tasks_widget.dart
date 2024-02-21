import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../constants.dart';
import '../../extensions/smooth_scroll/smooth_scroll_widget.dart';
import 'tasks_model.dart';

class TasksWidget extends StatelessWidget {
  const TasksWidget({super.key});

  @override
  Widget build(final BuildContext context) {
    return ChangeNotifierProvider(
      create: Tasks.new,
      child: const _TasksList(),
    );
  }
}

class _TasksList extends StatelessWidget {
  const _TasksList();

  @override
  Widget build(final BuildContext context) {
    late final Tasks model;
    var isInitialized = false;
    context.select((final Tasks newModel) {
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
        : const _TasksListContent();
  }
}

class _TasksListContent extends StatelessWidget {
  const _TasksListContent();

  @override
  Widget build(final BuildContext context) {
    late final Tasks model;
    var isInitialized = false;
    context.select((final Tasks newModel) {
      if (!isInitialized) {
        model = newModel;
        isInitialized = true;
      }
      return model.tasks.length;
    });

    return model.tasks.isEmpty
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
        : isDesktop
            ? SmoothScroll(
                controller: model.scrollController,
                child: ListView.builder(
                  controller: model.scrollController,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (final context, final index) => _Item(index: index),
                  itemCount: model.tasks.length,
                ),
              )
            : ListView.builder(
                controller: model.scrollController,
                itemBuilder: (final context, final index) => _Item(index: index),
                itemCount: model.tasks.length,
              );
  }
}

class _Item extends StatelessWidget {
  const _Item({required this.index});

  final int index;

  @override
  Widget build(final BuildContext context) {
    final model = context.read<Tasks>();

    return Card(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
      ),
      child: InkWell(
        onTap: () => model.open(index),
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        child: _ItemContent(index),
      ),
    );
  }
}

class _ItemContent extends StatelessWidget {
  const _ItemContent(this.index);

  final int index;

  @override
  Widget build(final BuildContext context) {
    late final Tasks model;
    var isInitialized = false;
    context.select((final Tasks newModel) {
      if (!isInitialized) {
        model = newModel;
        isInitialized = true;
      }
      return model.tasks.elementAtOrNull(index);
    });

    return model.tasks.length >= index
        ? ListTile(
            mouseCursor: SystemMouseCursors.click,
            enabled: !model.tasks[index].isDone,
            leading: model.tasks[index].isDone
                ? const Icon(
                    Icons.check_circle,
                  )
                : const Icon(
                    Icons.circle_outlined,
                  ),
            title: Text(
              model.tasks[index].text,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: model.tasks[index].isDone
                  ? const TextStyle(
                      decoration: TextDecoration.lineThrough,
                    )
                  : null,
            ),
            subtitle: Row(
              children: [
                if (model.tasks[index].imageUrl != null)
                  const Padding(
                    padding: EdgeInsets.only(right: 8),
                    child: Icon(
                      Icons.photo,
                      size: 16,
                    ),
                  ),
                if (model.tasks[index].deadline != null)
                  Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: Text(
                      model.tasks[index].deadline!.toLocal().toString(),
                    ),
                  ),
              ],
            ),
          )
        : const _DeletedItemContent();
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
