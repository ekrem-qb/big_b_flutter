import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../api/database.dart';
import '../../../api/entity/planned_task/planned_task.dart';
import '../../../api/entity/task/task.dart';
import '../../../extensions/dateTime.dart';
import '../extensions/pickers/date_picker.dart';
import '../extensions/pickers/time_picker.dart';
import '../extensions/snackbar.dart';

class TaskEditor extends ChangeNotifier {
  TaskEditor(this._context, {final PlannedTask? originalPlannedTask, final Task? originalTask})
      : id = originalPlannedTask?.id ?? originalTask?.id ?? -1,
        _time = originalPlannedTask?.time ?? (originalTask != null ? Duration(hours: originalTask.deadline.hour, minutes: originalTask.deadline.minute) : null) ?? DateTime.now().toTime(),
        _date = originalPlannedTask?.task.deadline ?? originalTask?.deadline ?? DateTime.now(),
        _isImageRequired = originalPlannedTask?.task.isImageRequired ?? originalTask?.isImageRequired ?? false,
        weekdays = originalPlannedTask?.weekdays.toList(growable: false) ?? List.filled(7, false),
        textController = TextEditingController(text: originalPlannedTask?.task.text ?? originalTask?.text ?? '');

  final _now = DateTime.now();
  final BuildContext _context;
  final TextEditingController textController;
  final int id;

  Duration _time;
  Duration get time => _time;

  DateTime _date;
  DateTime get date => _date;

  bool _isImageRequired;
  bool get isImageRequired => _isImageRequired;

  final List<bool> weekdays;

  bool get isRepeated => weekdays.any((final day) => day);

  bool _isUploading = false;
  bool get isUploading => _isUploading;
  set isUploading(final bool value) {
    if (_isUploading == value) return;

    _isUploading = value;
    notifyListeners();
  }

  // ignore: avoid_positional_boolean_parameters
  void setIsImageRequired(final bool? value) {
    if (value == null) return;
    if (value == _isImageRequired) return;

    _isImageRequired = value;
    notifyListeners();
  }

  Future<void> changeTime() async {
    final newTime = await showCupertinoTimePicker(
      context: _context,
      initialTime: _time,
    );

    if (newTime == null) return;
    if (newTime == _time) return;

    _time = newTime;
    notifyListeners();
  }

  Future<void> changeDate() async {
    final newDate = await showCupertinoDatePicker(
      context: _context,
      initialDate: _date,
      minimumDate: _now.copyWith(hour: 0, minute: 0, second: 0, millisecond: 0, microsecond: 0),
      showDayOfWeek: true,
    );

    if (newDate == null) return;
    if (newDate == _date) return;

    _date = newDate;
    notifyListeners();
  }

  void setDay(final int day, {required final bool value}) {
    if (weekdays[day] == value) return;

    weekdays[day] = value;
    notifyListeners();
  }

  Future<void> save() async {
    textController.text = textController.text.trim();

    if (textController.text.isEmpty) {
      showSnackbar(text: 'Açıklama alanını doldurunuz', context: _context);
      return;
    }

    isUploading = true;

    if (await Future.microtask(_upload)) {
      Navigator.pop(_context);
    }

    isUploading = false;
  }

  Future<bool> _upload() async {
    try {
      final now = DateTime.now();

      final task = Task(
        id: id,
        text: textController.text,
        isDone: false,
        updatedAt: now,
        deadline: date.copyWith(
          hour: time.inHours,
          minute: time.inMinutes % 60,
          second: 0,
          millisecond: 0,
          microsecond: 0,
        ),
        delay: Duration.zero,
        isImageRequired: isImageRequired,
      );

      if (isRepeated) {
        final plannedTask = PlannedTask(
          id: id,
          task: task,
          time: time,
          updatedAt: now,
          weekdays: weekdays,
        );

        switch (plannedTask.id) {
          case -1:
            await db.from(PlannedTask.tableName).insert(plannedTask.toJson());
          default:
            await db.from(PlannedTask.tableName).update(plannedTask.toJson()).eq('id', plannedTask.id);
        }
      } else {
        switch (task.id) {
          case -1:
            await db.from(Task.tableName).insert(task.toJson());
          default:
            await db.from(Task.tableName).update(task.toJson()).eq('id', task.id);
        }
      }
      return true;
    } on Exception catch (e) {
      showSnackbar(text: e.toString(), context: _context);
      return false;
    }
  }
}
