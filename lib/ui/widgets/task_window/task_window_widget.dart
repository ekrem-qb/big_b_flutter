import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../api/entity/task/task.dart';
import 'task_window_model.dart';

class TaskWindowWidget extends StatelessWidget {
  const TaskWindowWidget({required this.task, super.key});

  final Task task;

  @override
  Widget build(final BuildContext context) {
    return ChangeNotifierProvider(
      create: (final context) => TaskWindow(context, task),
      child: const Center(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Card(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: _Task(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _Task extends StatelessWidget {
  const _Task();

  @override
  Widget build(final BuildContext context) {
    late final TaskWindow model;
    var isInitialized = false;
    context.select((final TaskWindow newModel) {
      if (!isInitialized) {
        model = newModel;
        isInitialized = true;
      }
      return model.isDeleted;
    });

    return model.isDeleted
        ? Text(
            'Silinmiş',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.displaySmall?.copyWith(color: Colors.red),
          )
        : const Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  _IsDoneIcon(),
                  SizedBox(width: 16),
                  Flexible(
                    child: _Text(),
                  ),
                ],
              ),
              _Image(),
              _DateTime(),
            ],
          );
  }
}

class _IsDoneIcon extends StatelessWidget {
  const _IsDoneIcon();

  @override
  Widget build(final BuildContext context) {
    late final TaskWindow model;
    var isInitialized = false;
    context.select((final TaskWindow newModel) {
      if (!isInitialized) {
        model = newModel;
        isInitialized = true;
      }
      return model.task.isDone;
    });

    return Icon(
      model.task.isDone ? Icons.check_circle : Icons.circle_outlined,
      size: 32,
    );
  }
}

class _Text extends StatelessWidget {
  const _Text();

  @override
  Widget build(final BuildContext context) {
    late final TaskWindow model;
    var isInitialized = false;
    context.select((final TaskWindow newModel) {
      if (!isInitialized) {
        model = newModel;
        isInitialized = true;
      }
      return model.task.text;
    });

    return Text(
      model.task.text,
      style: Theme.of(context).textTheme.displaySmall,
    );
  }
}

class _Image extends StatelessWidget {
  const _Image();

  @override
  Widget build(final BuildContext context) {
    late final TaskWindow model;
    var isInitialized = false;
    context.select((final TaskWindow newModel) {
      if (!isInitialized) {
        model = newModel;
        isInitialized = true;
      }
      return model.task.imageUrl;
    });

    return model.task.imageUrl == null
        ? const SizedBox.shrink()
        : Card(
            elevation: 3,
            clipBehavior: Clip.antiAlias,
            margin: const EdgeInsets.only(top: 16),
            child: Image.network(
              model.task.imageUrl!.toString(),
              filterQuality: FilterQuality.medium,
              fit: BoxFit.cover,
              frameBuilder: (final context, final child, final frame, final wasSynchronouslyLoaded) {
                return wasSynchronouslyLoaded || frame != null
                    ? child
                    : const Center(
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 64),
                          child: CircularProgressIndicator(),
                        ),
                      );
              },
              errorBuilder: (final context, final error, final stackTrace) {
                return const Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 64),
                    child: Icon(
                      Icons.image_not_supported,
                      color: Colors.red,
                    ),
                  ),
                );
              },
            ),
          );
  }
}

class _DateTime extends StatelessWidget {
  const _DateTime();

  @override
  Widget build(final BuildContext context) {
    late final TaskWindow model;
    var isInitialized = false;
    context
      ..select((final TaskWindow newModel) {
        if (!isInitialized) {
          model = newModel;
          isInitialized = true;
        }
        return model.task.deadline == null;
      })
      ..select((final TaskWindow newModel) {
        if (!isInitialized) {
          model = newModel;
          isInitialized = true;
        }
        return model.task.delay == null;
      });

    return model.task.deadline == null && model.task.delay == null
        ? const SizedBox.shrink()
        : Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const _Deadline(),
              if (model.task.delay != null) const _Delay(),
            ],
          );
  }
}

class _Deadline extends StatelessWidget {
  const _Deadline();

  @override
  Widget build(final BuildContext context) {
    late final TaskWindow model;
    var isInitialized = false;
    context.select((final TaskWindow newModel) {
      if (!isInitialized) {
        model = newModel;
        isInitialized = true;
      }
      return model.task.deadline;
    });

    return model.task.deadline == null
        ? const SizedBox.shrink()
        : Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Row(
              children: [
                const Icon(Icons.calendar_month),
                const SizedBox(width: 8),
                Text(
                  model.task.deadline!.toLocal().toString(),
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
          );
  }
}

class _Delay extends StatelessWidget {
  const _Delay();

  @override
  Widget build(final BuildContext context) {
    late final TaskWindow model;
    var isInitialized = false;
    context.select((final TaskWindow newModel) {
      if (!isInitialized) {
        model = newModel;
        isInitialized = true;
      }
      return model.task.delay;
    });

    return model.task.delay == null
        ? const SizedBox.shrink()
        : Padding(
            padding: const EdgeInsets.only(top: 16, left: 16),
            child: DecoratedBox(
              decoration: UnderlineTabIndicator(
                borderSide: BorderSide(
                  color: model.task.delay!.isNegative ? Colors.green : Colors.red,
                  width: 4,
                ),
                borderRadius: const BorderRadius.all(
                  Radius.circular(16),
                ),
                insets: const EdgeInsets.only(bottom: -6),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.access_time),
                  const SizedBox(width: 8),
                  Text(
                    '${model.task.delay!.abs()} ${model.task.delay!.isNegative ? 'Erken' : 'Geç'} yapıldı',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ],
              ),
            ),
          );
  }
}
