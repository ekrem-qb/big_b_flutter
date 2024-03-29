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
      child: const Scaffold(
        body: _TasksList(),
        floatingActionButton: _NewTaskButton(),
      ),
    );
  }
}

class _NewTaskButton extends StatelessWidget {
  const _NewTaskButton();

  @override
  Widget build(final BuildContext context) {
    final model = context.read<Tasks>();

    return FloatingActionButton(
      onPressed: model.newTask,
      child: const Icon(Icons.add),
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
                  itemBuilder: _ItemCard.new,
                  itemCount: model.tasks.length,
                ),
              )
            : ListView.builder(
                controller: model.scrollController,
                itemBuilder: _ItemCard.new,
                itemCount: model.tasks.length,
              );
  }
}

class _ItemCard extends StatelessWidget {
  const _ItemCard(final BuildContext _, this.index);

  final int index;

  @override
  Widget build(final BuildContext context) {
    return Card(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
      ),
      child: _Item(index),
    );
  }
}

class _Item extends StatelessWidget {
  const _Item(this.index);

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
      return model.tasks.length >= index;
    });

    return model.tasks.length >= index ? _ItemContent(index) : const _DeletedItemContent();
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
      return model.tasks.elementAtOrNull(index)?.isDone;
    });

    return model.tasks[index].isDone
        ? InkWell(
            borderRadius: BorderRadius.circular(12),
            child: _ItemTile(index),
            onTap: () => model.open(index),
          )
        : _ItemTile(index);
  }
}

class _ItemTile extends StatelessWidget {
  const _ItemTile(this.index);

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

    return ListTile(
      mouseCursor: SystemMouseCursors.click,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
      ),
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
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: Text(
              model.tasks[index].deadline.toString(),
            ),
          ),
        ],
      ),
      onTap: () => model.open(index),
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
