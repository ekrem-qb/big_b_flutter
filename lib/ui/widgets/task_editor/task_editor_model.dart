import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../api/database.dart';
import '../../../api/entity/planned_task/planned_task.dart';
import '../../../api/entity/task/task.dart';
import '../../../extensions/date_time.dart';
import '../../../extensions/weekdays.dart';
import '../delete_dialog.dart';
import '../extensions/pickers/date_picker.dart';
import '../extensions/pickers/time_picker.dart';
import '../extensions/snackbar.dart';

class TaskEditor extends ChangeNotifier {
  TaskEditor(this._context, {final PlannedTask? originalPlannedTask, final Task? originalTask})
      : id = originalPlannedTask?.id ?? originalTask?.id ?? -1,
        isAlreadyPlanned = originalPlannedTask != null
            ? true
            : originalTask != null
                ? false
                : null,
        _time = originalPlannedTask?.deadline.toTime() ?? originalTask?.deadline.toTime() ?? DateTime.now().toTime(),
        _date = originalPlannedTask?.deadline ?? originalTask?.deadline ?? DateTime.now(),
        _isImageRequired = originalPlannedTask?.isImageRequired ?? originalTask?.isImageRequired ?? false,
        weekdays = originalPlannedTask?.weekdays ?? 0,
        textController = TextEditingController(text: originalPlannedTask?.text ?? originalTask?.text ?? '');

  final _now = DateTime.now();
  final BuildContext _context;
  final TextEditingController textController;
  final int id;
  final bool? isAlreadyPlanned;

  Duration _time;
  Duration get time => _time;

  DateTime _date;
  DateTime get date => _date;

  bool _isImageRequired;
  bool get isImageRequired => _isImageRequired;

  int weekdays;

  bool get isRepeated => weekdays > 0;

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
    if (isWeekdaySelected(day, weekdays) == value) return;
    if (day < 0 || day > 6) return;

    weekdays = value ? weekdays | 1 << day : weekdays & ~(1 << day);
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
      final isToday = isWeekdaySelected(now.weekday - 1, weekdays);
      final deadline = (isToday ? now : date).copyWithTime(time);

      final task = Task(
        id: id,
        text: textController.text,
        isDone: false,
        updatedAt: now,
        deadline: deadline,
        delay: Duration.zero,
        isImageRequired: isImageRequired,
      );

      if (isRepeated || (isAlreadyPlanned ?? false)) {
        final plannedTask = PlannedTask(
          id: id,
          text: textController.text,
          deadline: deadline,
          isImageRequired: isImageRequired,
          updatedAt: now,
          weekdays: weekdays,
        );

        switch (plannedTask.id) {
          case -1:
            await db.from(PlannedTask.tableName).insert(plannedTask.toJson());
          default:
            await db.from(PlannedTask.tableName).update(plannedTask.toJson()).eq('id', plannedTask.id);
        }

        if (isToday && isAlreadyPlanned == null) {
          await _uploadTask(task);
        }
      } else {
        await _uploadTask(task);
      }
      return true;
    } on Exception catch (e) {
      showSnackbar(text: e.toString(), context: _context);
      return false;
    }
  }

  Future<void> _uploadTask(final Task task) async {
    switch (task.id) {
      case -1:
        await db.from(Task.tableName).insert(task.toJson());
      default:
        await db.from(Task.tableName).update(task.toJson()).eq('id', task.id);
    }
  }

  Future<void> delete() async {
    if (isAlreadyPlanned == null) return;
    if (id == -1) return;

    final delete = await showDeleteDialog(itemName: 'görevi', context: _context);
    if (!delete) return;

    try {
      await db.from(isAlreadyPlanned! ? PlannedTask.tableName : Task.tableName).delete().eq('id', id);

      Navigator.pop(_context);
    } on Exception catch (e) {
      showSnackbar(text: e.toString(), context: _context);
    }
  }
}
