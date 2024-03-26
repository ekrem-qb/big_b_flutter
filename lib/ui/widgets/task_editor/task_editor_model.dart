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
      : _id = originalPlannedTask?.id ?? originalTask?.id ?? -1,
        isAlreadyPlanned = originalPlannedTask != null
            ? true
            : originalTask != null
                ? false
                : null,
        __time = originalPlannedTask?.deadline.toTime() ?? originalTask?.deadline.toTime() ?? DateTime.now().toTime(),
        __date = originalPlannedTask?.deadline ?? originalTask?.deadline ?? DateTime.now(),
        _isImageRequired = originalPlannedTask?.isImageRequired ?? originalTask?.isImageRequired ?? false,
        weekdays = originalPlannedTask?.weekdays ?? 0,
        textController = TextEditingController(text: originalPlannedTask?.text ?? originalTask?.text ?? '') {
    _timeText = _formatTime(_time);
    _dateText = _formatDate(_date);
  }

  final _now = DateTime.now();
  final BuildContext _context;
  final TextEditingController textController;
  final int _id;
  final bool? isAlreadyPlanned;

  Duration __time;
  Duration get _time => __time;
  set _time(final Duration value) {
    if (__time == value) return;

    __time = value;
    _timeText = _formatTime(_time);
    notifyListeners();
  }

  late String _timeText;
  String get time => _timeText;

  DateTime __date;
  DateTime get _date => __date;
  set _date(final DateTime value) {
    if (__date == value) return;

    __date = value;
    _dateText = _formatDate(_date);
    notifyListeners();
  }

  late String _dateText;
  String get date => _dateText;

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

    _time = newTime;
  }

  static String _formatTime(final Duration duration) {
    final minutes = duration.inHours.toString().padLeft(2, '0');
    final seconds = (duration.inMinutes % 60).toString().padLeft(2, '0');
    final time = '$minutes:$seconds';
    return time;
  }

  Future<void> changeDate() async {
    final newDate = await showCupertinoDatePicker(
      context: _context,
      initialDate: _date,
      minimumDate: _now.copyWithTime(Duration.zero),
      showDayOfWeek: true,
    );

    if (newDate == null) return;

    _date = newDate;
  }

  static String _formatDate(final DateTime date) {
    final day = date.day.toString().padLeft(2, '0');
    final month = date.month.toString().padLeft(2, '0');
    final year = date.year.toString();
    final formattedDate = '$day.$month.$year';
    return formattedDate;
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
      final deadline = (isToday ? now : _date).copyWithTime(_time);

      final task = Task(
        id: _id,
        text: textController.text,
        isDone: false,
        updatedAt: now,
        deadline: deadline,
        delay: Duration.zero,
        isImageRequired: isImageRequired,
      );

      if (isRepeated || (isAlreadyPlanned ?? false)) {
        final plannedTask = PlannedTask(
          id: _id,
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
    if (_id == -1) return;

    final delete = await showDeleteDialog(itemName: 'görevi', context: _context);
    if (!delete) return;

    try {
      await db.from(isAlreadyPlanned! ? PlannedTask.tableName : Task.tableName).delete().eq('id', _id);

      Navigator.pop(_context);
    } on Exception catch (e) {
      showSnackbar(text: e.toString(), context: _context);
    }
  }
}
