import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../api/entity/planned_task/planned_task.dart';
import '../../../api/entity/task/task.dart';
import '../../../constants.dart';
import 'task_editor_model.dart';

const _textStyle = TextStyle(fontSize: 22, fontWeight: FontWeight.w400, letterSpacing: 0, height: 1.27);
const _smallTextStyle = TextStyle(fontSize: 16, fontWeight: FontWeight.w500, letterSpacing: 0.15, height: 1.50);
const _largeTextStyle = TextStyle(fontSize: 32, fontWeight: FontWeight.bold, letterSpacing: 0, height: 1.25);

class TaskEditorWidget extends StatelessWidget {
  const TaskEditorWidget({this.plannedTask, this.task, super.key});

  final PlannedTask? plannedTask;
  final Task? task;

  @override
  Widget build(final BuildContext context) {
    return ChangeNotifierProvider(
      create: (final context) => TaskEditor(context, originalPlannedTask: plannedTask, originalTask: task),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Yeni görev'),
        ),
        body: const SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Açıklama', style: _smallTextStyle),
                SizedBox(height: 8),
                _Text(),
                SizedBox(height: 16),
                _ImageToggle(),
                SizedBox(height: 16),
                Row(
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Saat', style: _smallTextStyle),
                        SizedBox(height: 8),
                        _Time(),
                      ],
                    ),
                    SizedBox(width: 16),
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Tarih', style: _smallTextStyle),
                          SizedBox(height: 8),
                          _Date(),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Text('Tekrarlama', style: _smallTextStyle),
                SizedBox(height: 8),
                Row(
                  children: [
                    _Day(day: 0, text: 'Pzt'),
                    SizedBox(width: 8),
                    _Day(day: 1, text: 'Sal'),
                    SizedBox(width: 8),
                    _Day(day: 2, text: 'Çar'),
                    SizedBox(width: 8),
                    _Day(day: 3, text: 'Per'),
                    SizedBox(width: 8),
                    _Day(day: 4, text: 'Cum'),
                    SizedBox(width: 8),
                    _Day(day: 5, text: 'Cmt'),
                    SizedBox(width: 8),
                    _Day(day: 6, text: 'Paz'),
                  ],
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: const Padding(
          padding: EdgeInsets.all(8),
          child: _SaveButton(),
        ),
      ),
    );
  }
}

class _Text extends StatelessWidget {
  const _Text();

  @override
  Widget build(final BuildContext context) {
    final model = context.read<TaskEditor>();

    return TextField(
      controller: model.textController,
      minLines: 3,
      maxLines: 8,
      decoration: const InputDecoration(border: OutlineInputBorder()),
    );
  }
}

class _ImageToggle extends StatelessWidget {
  const _ImageToggle();

  @override
  Widget build(final BuildContext context) {
    late final TaskEditor model;
    var isInitialized = false;
    context.select((final TaskEditor newModel) {
      if (!isInitialized) {
        model = newModel;
        isInitialized = true;
      }
      return model.isImageRequired;
    });

    return Chip(
      padding: EdgeInsets.zero,
      labelPadding: EdgeInsets.zero,
      clipBehavior: Clip.antiAlias,
      label: CheckboxListTile(
        title: const Text('Fotoğraf eklenmesi lazım'),
        controlAffinity: ListTileControlAffinity.leading,
        value: model.isImageRequired,
        focusNode: skippedFocusNode,
        contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        onChanged: model.setIsImageRequired,
      ),
    );
  }
}

class _Time extends StatelessWidget {
  const _Time();

  String _formatTime(final Duration duration) {
    final minutes = duration.inHours.toString().padLeft(2, '0');
    final seconds = (duration.inMinutes % 60).toString().padLeft(2, '0');
    final time = '$minutes:$seconds';
    return time;
  }

  @override
  Widget build(final BuildContext context) {
    late final TaskEditor model;
    var isInitialized = false;
    context.select((final TaskEditor newModel) {
      if (!isInitialized) {
        model = newModel;
        isInitialized = true;
      }
      return model.time;
    });

    return ActionChip(
      label: Text(
        _formatTime(model.time),
        style: _largeTextStyle,
      ),
      onPressed: model.changeTime,
    );
  }
}

class _Date extends StatelessWidget {
  const _Date();

  String _formatDate(final DateTime date) {
    final day = date.day.toString().padLeft(2, '0');
    final month = date.month.toString().padLeft(2, '0');
    final year = date.year.toString();
    final formattedDate = '$day.$month.$year';
    return formattedDate;
  }

  @override
  Widget build(final BuildContext context) {
    late final TaskEditor model;
    var isInitialized = false;
    context
      ..select((final TaskEditor newModel) {
        if (!isInitialized) {
          model = newModel;
          isInitialized = true;
        }
        return model.date;
      })
      ..select((final TaskEditor newModel) {
        if (!isInitialized) {
          model = newModel;
          isInitialized = true;
        }
        return model.isRepeated;
      });

    return ActionChip(
      label: Text(
        _formatDate(model.date.toLocal()),
        style: _largeTextStyle,
      ),
      onPressed: model.isRepeated ? null : model.changeDate,
    );
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
    late final TaskEditor model;
    var isInitialized = false;
    context.select((final TaskEditor newModel) {
      if (!isInitialized) {
        model = newModel;
        isInitialized = true;
      }
      return model.weekdays[day];
    });

    return Flexible(
      child: InputChip(
        showCheckmark: MediaQuery.of(context).size.width > 600,
        selected: model.weekdays[day],
        onSelected: (final value) => model.setDay(day, value: value),
        labelPadding: EdgeInsets.zero,
        label: FittedBox(
          fit: BoxFit.fitHeight,
          child: Text(
            text,
            style: _textStyle,
          ),
        ),
      ),
    );
  }
}

class _SaveButton extends StatelessWidget {
  const _SaveButton();

  @override
  Widget build(final BuildContext context) {
    late final TaskEditor model;
    var isInitialized = false;
    context.select((final TaskEditor newModel) {
      if (!isInitialized) {
        model = newModel;
        isInitialized = true;
      }
      return model.isUploading;
    });

    return AnimatedCrossFade(
      firstChild: const LinearProgressIndicator(
        minHeight: 56,
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      secondChild: SizedBox(
        width: double.infinity,
        child: FloatingActionButton.extended(
          icon: const Icon(Icons.save),
          label: const Text('Kaydet'),
          onPressed: model.save,
        ),
      ),
      crossFadeState: model.isUploading ? CrossFadeState.showFirst : CrossFadeState.showSecond,
      duration: const Duration(milliseconds: 500),
    );
  }
}
