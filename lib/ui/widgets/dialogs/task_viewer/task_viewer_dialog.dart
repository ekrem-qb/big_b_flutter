import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../api/entity/task/task.dart';
import '../../../app_router/app_router.dart';
import '../../../entity/status.dart';
import '../../../theme.dart';
import '../../error_panel.dart';
import '../../extensions/mouse_navigator.dart';
import '../../extensions/shimmer.dart';
import '../../extensions/smooth_mouse_scroll/smooth_mouse_scroll.dart';
import '../../extensions/snackbar.dart';
import '../delete_dialog.dart';
import 'bloc/task_viewer_bloc.dart';

const kImageAspectRatio = 16 / 9;

@RoutePage()
class TaskViewerDialog extends StatelessWidget {
  const TaskViewerDialog({@pathParam required this.id, this.task, super.key});

  final int id;
  final Task? task;

  @override
  Widget build(final BuildContext context) {
    return BlocProvider(
      create: (final context) => TaskViewerBloc(id, task),
      child: const TaskViewerView(),
    );
  }
}

class TaskViewerView extends StatelessWidget {
  const TaskViewerView({
    super.key,
  });

  @override
  Widget build(final BuildContext context) {
    final bloc = context.read<TaskViewerBloc>();

    return MouseNavigator(
      child: BlocListener<TaskViewerBloc, TaskViewerState>(
        listener: (final context, final state) async {
          switch (state.deleteState) {
            case OperationStatusInProgress():
              final isDeleted = await showDeleteDialog(itemName: 'görevi', context: context);
              bloc.add(TaskViewerEventDeleteDialogClosed(isDeleted: isDeleted));
            case OperationStatusCompleted():
              Navigator.pop(context);
            case OperationStatusError(
                :final error
              ):
              showSnackbar(text: error, context: context);
            default:
          }
        },
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
                  child: SmoothMouseScroll(
                    builder: (final context, final child, final controller, final physics) {
                      return SingleChildScrollView(
                        controller: controller,
                        physics: physics,
                        child: const _Text(),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
          content: SmoothMouseScroll(
            builder: (final context, final child, final controller, final physics) {
              return SingleChildScrollView(
                controller: controller,
                physics: physics,
                child: const _Task(),
              );
            },
          ),
          actionsAlignment: MainAxisAlignment.spaceBetween,
          actions: const [
            _DeleteButton(),
            _EditButton(),
          ],
        ),
      ),
    );
  }
}

class _Task extends StatelessWidget {
  const _Task();

  @override
  Widget build(final BuildContext context) {
    late final TaskViewerBloc bloc;
    var isInitialized = false;
    context.select((final TaskViewerBloc newBloc) {
      if (!isInitialized) {
        bloc = newBloc;
        isInitialized = true;
      }
      return bloc.state.task.runtimeType;
    });

    return switch (bloc.state.task) {
      StatusOfData() => const Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _Image(),
            SizedBox(height: 16),
            _Time(),
          ],
        ),
      StatusOfLoading() => const Center(child: CircularProgressIndicator()),
      StatusOfError(
        :final error,
      ) =>
        ErrorPanel(
          error: error,
          onRefresh: () => bloc.add(const TaskViewerEventLoadRequested()),
        ),
    };
  }
}

class _IsDoneIcon extends StatelessWidget {
  const _IsDoneIcon();

  @override
  Widget build(final BuildContext context) {
    late final TaskViewerBloc bloc;
    var isInitialized = false;
    final isDone = context.select((final TaskViewerBloc newBloc) {
      if (!isInitialized) {
        bloc = newBloc;
        isInitialized = true;
      }
      return switch (bloc.state.task) {
        StatusOfData(
          :final data
        ) =>
          data.isDone,
        _ => false,
      };
    });

    return Icon(
      isDone ? Icons.check_circle : Icons.circle_outlined,
      size: 32,
    );
  }
}

class _Text extends StatelessWidget {
  const _Text();

  @override
  Widget build(final BuildContext context) {
    late final TaskViewerBloc bloc;
    var isInitialized = false;
    final text = context.select((final TaskViewerBloc newBloc) {
      if (!isInitialized) {
        bloc = newBloc;
        isInitialized = true;
      }
      return switch (bloc.state.task) {
        StatusOfData(
          :final data
        ) =>
          data.text,
        _ => '',
      };
    });

    return Text(
      text,
      style: const TextStyle(fontWeight: FontWeight.w500),
    );
  }
}

class _Image extends StatelessWidget {
  const _Image();

  @override
  Widget build(final BuildContext context) {
    late final TaskViewerBloc bloc;
    var isInitialized = false;
    final imageUrl = context.select((final TaskViewerBloc newBloc) {
      if (!isInitialized) {
        bloc = newBloc;
        isInitialized = true;
      }
      return switch (bloc.state.task) {
        StatusOfData(
          :final data
        ) =>
          data.imageUrl,
        _ => null,
      };
    });

    return imageUrl == null
        ? const SizedBox.shrink()
        : GestureDetector(
            onTap: () {},
            child: Material(
              elevation: 3,
              clipBehavior: Clip.antiAlias,
              borderRadius: kDefaultRadius,
              child: Image.network(
                imageUrl.toString(),
                fit: BoxFit.cover,
                frameBuilder: (final context, final child, final frame, final wasSynchronouslyLoaded) {
                  final colorScheme = Theme.of(context).colorScheme;
                  final isLoaded = frame != null;

                  return AnimatedSize(
                    duration: Durations.medium1,
                    child: Shimmer.fromColors(
                      baseColor: colorScheme.surfaceContainerLow,
                      highlightColor: Color.lerp(colorScheme.onSurface, colorScheme.surfaceContainerLow, 0.85)!,
                      enabled: !isLoaded,
                      child: isLoaded
                          ? child
                          : const ColoredBox(
                              color: Colors.white,
                              child: AspectRatio(
                                aspectRatio: kImageAspectRatio,
                              ),
                            ),
                    ),
                  );
                },
                errorBuilder: (final context, final error, final stackTrace) {
                  return const AspectRatio(
                    aspectRatio: kImageAspectRatio,
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.all(64),
                        child: Icon(
                          Icons.image_not_supported,
                          color: Colors.red,
                        ),
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
    late final TaskViewerBloc bloc;
    var isInitialized = false;
    final isDone = context.select((final TaskViewerBloc newBloc) {
      if (!isInitialized) {
        bloc = newBloc;
        isInitialized = true;
      }
      return switch (bloc.state.task) {
        StatusOfData(
          :final data
        ) =>
          data.isDone,
        _ => false,
      };
    });

    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const Flexible(child: _Deadline()),
        if (isDone) const Flexible(child: _Delay()),
      ],
    );
  }
}

class _Deadline extends StatelessWidget {
  const _Deadline();

  @override
  Widget build(final BuildContext context) {
    late final TaskViewerBloc bloc;
    var isInitialized = false;
    final deadline = context.select((final TaskViewerBloc newBloc) {
      if (!isInitialized) {
        bloc = newBloc;
        isInitialized = true;
      }
      return switch (bloc.state.task) {
        StatusOfData(
          :final data
        ) =>
          data.deadline,
        _ => null,
      };
    });

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Icon(Icons.calendar_month),
        const SizedBox(width: 8),
        Flexible(
          child: Text(
            deadline.toString(),
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
    late final TaskViewerBloc bloc;
    var isInitialized = false;
    final delay = context.select((final TaskViewerBloc newBloc) {
      if (!isInitialized) {
        bloc = newBloc;
        isInitialized = true;
      }
      return switch (bloc.state.task) {
        StatusOfData(
          :final data
        ) =>
          data.delay,
        _ => null,
      };
    });

    return Padding(
      padding: const EdgeInsets.only(left: 16),
      child: DecoratedBox(
        decoration: UnderlineTabIndicator(
          borderSide: BorderSide(
            color: delay == Duration.zero ? Colors.green : Colors.red,
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
                delay == Duration.zero ? 'Tam zamanında yapıldı' : '${delay?.abs()} Geç yapıldı',
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
    final bloc = context.read<TaskViewerBloc>();

    return TextButton.icon(
      icon: const Icon(Icons.delete),
      label: const Text('Sil'),
      onPressed: () => bloc.add(const TaskViewerEventDeleteDialogOpened()),
    );
  }
}

class _EditButton extends StatelessWidget {
  const _EditButton();

  @override
  Widget build(final BuildContext context) {
    final bloc = context.read<TaskViewerBloc>();

    return TextButton.icon(
      icon: const Icon(Icons.edit),
      label: const Text('Düzenle'),
      onPressed: () => context.pushRoute(
        TaskEditorRoute(
          taskId: bloc.state.id,
          task: switch (bloc.state.task) {
            StatusOfData(
              :final data
            ) =>
              data,
            _ => null,
          },
        ),
      ),
    );
  }
}
