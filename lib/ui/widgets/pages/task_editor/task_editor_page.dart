import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../api/entity/planned_task/planned_task.dart';
import '../../../../api/entity/task/task.dart';
import '../../../../constants.dart';
import '../../../../extensions/date_time.dart';
import '../../../../extensions/duration.dart';
import '../../../../extensions/weekdays.dart';
import '../../../entity/status.dart';
import '../../../theme.dart';
import '../../dialogs/delete_dialog.dart';
import '../../dialogs/profiles_picker/profiles_picker_dialog.dart';
import '../../error_panel.dart';
import '../../extensions/pickers/date_picker.dart';
import '../../extensions/pickers/time_picker.dart';
import '../../extensions/smooth_mouse_scroll/smooth_mouse_scroll.dart';
import '../../extensions/snackbar.dart';
import '../../save_button.dart';
import 'bloc/task_editor_bloc.dart';

@RoutePage()
class NewTaskEditorPage extends StatelessWidget {
  const NewTaskEditorPage({super.key});

  @override
  Widget build(final BuildContext context) {
    return BlocProvider(
      create: (final context) => TaskEditorBloc(),
      child: const TaskEditorView(isNew: true),
    );
  }
}

@RoutePage()
class TaskEditorPage extends StatelessWidget {
  const TaskEditorPage({@pathParam required this.taskId, this.task, super.key});

  final int taskId;
  final Task? task;

  @override
  Widget build(final BuildContext context) {
    return BlocProvider(
      key: ValueKey(taskId),
      create:
          (final context) => TaskEditorBloc(taskId: taskId, originalTask: task),
      child: const TaskEditorView(isNew: false),
    );
  }
}

@RoutePage()
class PlannedTaskEditorPage extends StatelessWidget {
  const PlannedTaskEditorPage({
    @pathParam required this.plannedTaskId,
    this.plannedTask,
    super.key,
  });

  final int plannedTaskId;
  final PlannedTask? plannedTask;

  @override
  Widget build(final BuildContext context) {
    return BlocProvider(
      key: ValueKey(plannedTaskId),
      create:
          (final context) => TaskEditorBloc(
            plannedTaskId: plannedTaskId,
            originalPlannedTask: plannedTask,
          ),
      child: const TaskEditorView(isNew: false),
    );
  }
}

class TaskEditorView extends StatelessWidget {
  const TaskEditorView({required this.isNew, super.key});

  final bool isNew;

  @override
  Widget build(final BuildContext context) {
    final (bloc, _) = context.select(
      (final TaskEditorBloc bloc) => (
        bloc,
        bloc.state.loadingState.runtimeType,
      ),
    );

    return BlocListener<TaskEditorBloc, TaskEditorState>(
      listener: (final context, final state) async {
        switch (state.uploadState) {
          case OperationStatusCompleted():
            Navigator.pop(context);
          case OperationStatusError(:final error):
            showSnackbar(text: error.toString(), context: context);
          default:
        }
        switch (state.deleteState) {
          case OperationStatusCompleted():
            Navigator.pop(context);
          case OperationStatusError(:final error):
            showSnackbar(text: error.toString(), context: context);
          default:
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: isNew ? const Text('Yeni görev') : null,
          actions: [if (!isNew) const _DeleteButton()],
        ),
        body: switch (bloc.state.loadingState) {
          StatusLoading() => const Center(child: CircularProgressIndicator()),
          StatusError(:final error) => ErrorPanel(
            error: error.toString(),
            onRefresh: () => bloc.add(const TaskEditorEventLoadRequested()),
          ),
          StatusCompleted() => const _Body(),
        },
        bottomNavigationBar:
            bloc.state.loadingState is StatusCompleted
                ? const _SaveButton()
                : null,
      ),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(final BuildContext context) {
    return SmoothMouseScroll(
      builder: (final context, final child, final controller, final physics) {
        return SingleChildScrollView(
          controller: controller,
          physics: physics,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Açıklama', style: smallTextStyle),
                const SizedBox(height: 8),
                const _Text(),
                const SizedBox(height: 16),
                const _ImageToggle(),
                const SizedBox(height: 16),
                const Row(
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Saat', style: smallTextStyle),
                        SizedBox(height: 8),
                        _Time(),
                      ],
                    ),
                    SizedBox(width: 16),
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Tarih', style: smallTextStyle),
                          SizedBox(height: 8),
                          _Date(),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                const Text('Tekrarlama', style: smallTextStyle),
                const SizedBox(height: 8),
                Row(
                  children: [
                    _Day(day: 0, text: weekdayNames[0]),
                    const SizedBox(width: 8),
                    _Day(day: 1, text: weekdayNames[1]),
                    const SizedBox(width: 8),
                    _Day(day: 2, text: weekdayNames[2]),
                    const SizedBox(width: 8),
                    _Day(day: 3, text: weekdayNames[3]),
                    const SizedBox(width: 8),
                    _Day(day: 4, text: weekdayNames[4]),
                    const SizedBox(width: 8),
                    _Day(day: 5, text: weekdayNames[5]),
                    const SizedBox(width: 8),
                    _Day(day: 6, text: weekdayNames[6]),
                  ],
                ),
                const SizedBox(height: 16),
                const Text('Görevli', style: smallTextStyle),
                const SizedBox(height: 8),
                const _Executives(),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _DeleteButton extends StatelessWidget {
  const _DeleteButton();

  @override
  Widget build(final BuildContext context) {
    final bloc = context.read<TaskEditorBloc>();

    return ConstrainedBox(
      constraints: const BoxConstraints.tightFor(
        width: kToolbarHeight,
        height: kToolbarHeight,
      ),
      child: IconButton(
        icon: const Icon(Icons.delete),
        tooltip: MaterialLocalizations.of(context).deleteButtonTooltip,
        onPressed: () async {
          if (await showDeleteDialog(itemName: 'görevi', context: context)) {
            bloc.add(const TaskEditorEventDeleteRequested());
          }
        },
      ),
    );
  }
}

class _Text extends StatelessWidget {
  const _Text();

  @override
  Widget build(final BuildContext context) {
    final (bloc, error) = context.select(
      (final TaskEditorBloc bloc) => (bloc, bloc.state.textError),
    );

    final text = bloc.state.text;

    return TextFormField(
      decoration: InputDecoration(errorText: error),
      initialValue: text,
      minLines: 3,
      maxLines: 8,
      onChanged: (final value) => bloc.add(TaskEditorEventTextChanged(value)),
    );
  }
}

class _ImageToggle extends StatelessWidget {
  const _ImageToggle();

  static const kBorderRadius = BorderRadius.all(Radius.circular(8));

  @override
  Widget build(final BuildContext context) {
    final (bloc, isImageRequired) = context.select(
      (final TaskEditorBloc bloc) => (bloc, bloc.state.isImageRequired),
    );

    return Material(
      shape: RoundedRectangleBorder(
        borderRadius: kBorderRadius,
        side: BorderSide(color: Theme.of(context).colorScheme.outline),
      ),
      clipBehavior: Clip.antiAlias,
      child: CheckboxListTile(
        shape: const RoundedRectangleBorder(borderRadius: kBorderRadius),
        title: const Text('Fotoğraf eklenmesi lazım'),
        controlAffinity: ListTileControlAffinity.leading,
        value: isImageRequired,
        focusNode: skippedFocusNode,
        contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
        onChanged:
            (final value) => bloc.add(
              TaskEditorEventIsImageRequiredChanged(value: value ?? false),
            ),
      ),
    );
  }
}

class _Time extends StatelessWidget {
  const _Time();

  @override
  Widget build(final BuildContext context) {
    final (bloc, time) = context.select(
      (final TaskEditorBloc bloc) => (bloc, bloc.state.time),
    );

    return ActionChip(
      label: Text(time.toHoursAndMinutes(), style: largeTextStyle),
      onPressed: () async {
        final newTime = await showCupertinoTimePicker(
          context: context,
          initialTime: time,
        );

        if (newTime == null) return;

        bloc.add(TaskEditorEventTimeChanged(newTime));
      },
    );
  }
}

String _formatDate(final DateTime date) {
  final day = date.day.toString().padLeft(2, '0');
  final month = date.month.toString().padLeft(2, '0');
  final year = date.year.toString();
  final formattedDate = '$day.$month.$year';
  return formattedDate;
}

class _Date extends StatelessWidget {
  const _Date();

  @override
  Widget build(final BuildContext context) {
    final (bloc, date, isRepeated) = context.select(
      (final TaskEditorBloc bloc) => (
        bloc,
        bloc.state.date,
        bloc.state.isRepeated,
      ),
    );

    return ActionChip(
      label: Text(_formatDate(date), style: largeTextStyle),
      onPressed:
          isRepeated || bloc.state.isPlanned
              ? null
              : () async {
                final now = DateTime.now();

                final newDate = await showCupertinoDatePicker(
                  context: context,
                  initialDate: date,
                  minimumDate:
                      date.isBefore(now)
                          ? date
                          : now.copyWithTime(Duration.zero),
                  showDayOfWeek: true,
                );

                if (newDate == null) return;

                bloc.add(TaskEditorEventDateChanged(newDate));
              },
    );
  }
}

class _Day extends StatelessWidget {
  const _Day({required this.day, required this.text});

  final int day;
  final String text;

  @override
  Widget build(final BuildContext context) {
    final (bloc, isSelected) = context.select(
      (final TaskEditorBloc bloc) => (
        bloc,
        isWeekdaySelected(day, bloc.state.weekdays),
      ),
    );

    return Flexible(
      child: InputChip(
        isEnabled: bloc.state.isNew || bloc.state.isPlanned,
        showCheckmark: MediaQuery.of(context).size.width > 600,
        selected: isSelected,
        onSelected:
            (final value) =>
                bloc.add(TaskEditorEventWeekdayToggled(day: day, value: value)),
        labelPadding: EdgeInsets.zero,
        label: FittedBox(
          fit: BoxFit.fitHeight,
          child: Text(text, style: textStyle),
        ),
      ),
    );
  }
}

class _Executives extends StatelessWidget {
  const _Executives();

  @override
  Widget build(final BuildContext context) {
    final (bloc, count) = context.select(
      (final TaskEditorBloc bloc) => (bloc, bloc.state.executives.length),
    );

    return Wrap(
      spacing: 8,
      runSpacing:
          Theme.of(context).materialTapTargetSize ==
                  MaterialTapTargetSize.shrinkWrap
              ? 8
              : 0,
      children: [
        for (var i = 0; i < count; i++)
          InputChip(
            label: Text(bloc.state.executives[i].name),
            deleteIcon: const Icon(Icons.cancel, size: 18),
            onDeleted: () => bloc.add(TaskEditorEventExecutiveRemoved(i)),
          ),
        IconButton.filledTonal(
          visualDensity: VisualDensity.compact,
          padding: EdgeInsets.zero,
          icon: const Icon(Icons.add),
          onPressed: () async {
            final newExecutives = await showProfilesPicker(
              context,
              excluded: bloc.state.executives,
            );
            if (newExecutives.isEmpty) return;

            bloc.add(TaskEditorEventExecutivesAdded(newExecutives));
          },
        ),
      ],
    );
  }
}

class _SaveButton extends StatelessWidget {
  const _SaveButton();

  @override
  Widget build(final BuildContext context) {
    final (bloc, uploadState) = context.select(
      (final TaskEditorBloc bloc) => (bloc, bloc.state.uploadState),
    );

    return SaveButton(
      isLoading: uploadState is OperationStatusInProgress,
      onPressed: () => bloc.add(const TaskEditorEventSaveRequested()),
    );
  }
}
