import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../api/entity/task/task.dart';
import 'task_viewer_model.dart';

class TaskViewerDialog extends StatelessWidget {
  const TaskViewerDialog({required this.task, super.key});

  final Task task;

  @override
  Widget build(final BuildContext context) {
    return ChangeNotifierProvider(
      create: (final context) => TaskViewer(context, task),
      child: AlertDialog(
        insetPadding: const EdgeInsets.all(16),
        title: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const _IsDoneIcon(),
            const SizedBox(width: 8),
            Flexible(
              child: ConstrainedBox(
                constraints: const BoxConstraints(
                  maxHeight: 140,
                ),
                child: const SingleChildScrollView(
                  child: _Text(),
                ),
              ),
            ),
          ],
        ),
        content: const SingleChildScrollView(
          child: _Task(),
        ),
        actionsAlignment: MainAxisAlignment.spaceBetween,
        actions: const [
          _DeleteButton(),
          _EditButton(),
        ],
      ),
    );
  }
}

class _Task extends StatelessWidget {
  const _Task();

  @override
  Widget build(final BuildContext context) {
    late final TaskViewer model;
    var isInitialized = false;
    context.select((final TaskViewer newModel) {
      if (!isInitialized) {
        model = newModel;
        isInitialized = true;
      }
      return model.task == null;
    });

    return model.task == null
        ? Text(
            'Silinmiş',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.displaySmall?.copyWith(color: Colors.red),
          )
        : const Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _Image(),
              SizedBox(height: 16),
              _Time(),
            ],
          );
  }
}

class _IsDoneIcon extends StatelessWidget {
  const _IsDoneIcon();

  @override
  Widget build(final BuildContext context) {
    late final TaskViewer model;
    var isInitialized = false;
    context.select((final TaskViewer newModel) {
      if (!isInitialized) {
        model = newModel;
        isInitialized = true;
      }
      return model.task?.isDone;
    });

    return Icon(
      model.task!.isDone ? Icons.check_circle : Icons.circle_outlined,
      size: 32,
    );
  }
}

class _Text extends StatelessWidget {
  const _Text();

  @override
  Widget build(final BuildContext context) {
    late final TaskViewer model;
    var isInitialized = false;
    context.select((final TaskViewer newModel) {
      if (!isInitialized) {
        model = newModel;
        isInitialized = true;
      }
      return model.task?.text;
    });

    return Text(
      model.task!.text,
      style: const TextStyle(fontWeight: FontWeight.w500),
    );
  }
}

class _Image extends StatelessWidget {
  const _Image();

  @override
  Widget build(final BuildContext context) {
    late final TaskViewer model;
    var isInitialized = false;
    context.select((final TaskViewer newModel) {
      if (!isInitialized) {
        model = newModel;
        isInitialized = true;
      }
      return model.task?.imageUrl;
    });

    return model.task?.imageUrl == null
        ? const SizedBox.shrink()
        : GestureDetector(
            onTap: () {
              // TODO(ekrem-qb): Fullscreen image viewer
            },
            child: Material(
              elevation: 3,
              clipBehavior: Clip.antiAlias,
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                model.task!.imageUrl!.toString(),
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
            ),
          );
  }
}

class _Time extends StatelessWidget {
  const _Time();

  @override
  Widget build(final BuildContext context) {
    late final TaskViewer model;
    var isInitialized = false;
    context.select((final TaskViewer newModel) {
      if (!isInitialized) {
        model = newModel;
        isInitialized = true;
      }
      return model.task?.isDone;
    });

    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const Flexible(child: _Deadline()),
        if (model.task!.isDone) const Flexible(child: _Delay()),
      ],
    );
  }
}

class _Deadline extends StatelessWidget {
  const _Deadline();

  @override
  Widget build(final BuildContext context) {
    late final TaskViewer model;
    var isInitialized = false;
    context.select((final TaskViewer newModel) {
      if (!isInitialized) {
        model = newModel;
        isInitialized = true;
      }
      return model.task?.deadline;
    });

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Icon(Icons.calendar_month),
        const SizedBox(width: 8),
        Flexible(
          child: Text(
            model.task!.deadline.toString(),
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
      ],
    );
  }
}

class _Delay extends StatelessWidget {
  const _Delay();

  @override
  Widget build(final BuildContext context) {
    late final TaskViewer model;
    var isInitialized = false;
    context.select((final TaskViewer newModel) {
      if (!isInitialized) {
        model = newModel;
        isInitialized = true;
      }
      return model.task?.delay;
    });

    return Padding(
      padding: const EdgeInsets.only(left: 16),
      child: DecoratedBox(
        decoration: UnderlineTabIndicator(
          borderSide: BorderSide(
            color: model.task!.delay == Duration.zero ? Colors.green : Colors.red,
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
            Flexible(
              child: Text(
                model.task!.delay == Duration.zero ? 'Tam zamanında yapıldı' : '${model.task!.delay.abs()} Geç yapıldı',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DeleteButton extends StatelessWidget {
  const _DeleteButton();

  @override
  Widget build(final BuildContext context) {
    final model = context.read<TaskViewer>();

    return TextButton.icon(
      icon: const Icon(Icons.delete),
      label: const Text('Sil'),
      onPressed: model.delete,
    );
  }
}

class _EditButton extends StatelessWidget {
  const _EditButton();

  @override
  Widget build(final BuildContext context) {
    final model = context.read<TaskViewer>();

    return TextButton.icon(
      icon: const Icon(Icons.edit),
      label: const Text('Düzenle'),
      onPressed: model.edit,
    );
  }
}
