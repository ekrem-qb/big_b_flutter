import 'dart:async';

import 'package:flutter/cupertino.dart';

import '../../../api/database.dart';
import '../../../api/entity/planned_task/planned_task.dart';
import '../../../api/entity/profile/profile.dart';
import '../../../api/entity/profile_join/profile_join.dart';
import '../../../api/entity/task/task.dart';
import '../../../extensions/date_time.dart';
import '../../../extensions/weekdays.dart';
import '../delete_dialog.dart';
import '../extensions/pickers/date_picker.dart';
import '../extensions/pickers/time_picker.dart';
import '../extensions/snackbar.dart';
import '../profiles_picker/profiles_picker_widget.dart';

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
        textController = TextEditingController(text: originalPlannedTask?.text ?? originalTask?.text ?? ''),
        executives = originalPlannedTask?.executives.toList() ?? originalTask?.executives.toList() ?? [] {
    _timeText = _formatTime(_time);
    _dateText = _formatDate(_date);
  }

  final _now = DateTime.now();
  final BuildContext _context;
  final TextEditingController textController;
  final int _id;
  final bool? isAlreadyPlanned;
  final List<Profile> executives;

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
      minimumDate: _date.isBefore(_now) ? _date : _now.copyWithTime(Duration.zero),
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

  void removeExecutive(final int index) {
    executives.removeAt(index);
    notifyListeners();
  }

  Future<void> addExecutives() async {
    final newExecutives = await showProfilesPicker(_context, excluded: executives);
    if (newExecutives.isEmpty) return;

    executives.addAll(newExecutives);
    notifyListeners();
  }

  Future<void> save() async {
    textController.text = textController.text.trim();

    if (textController.text.isEmpty) {
      showSnackbar(text: 'Açıklama alanını doldurunuz', context: _context);
      return;
    }

    isUploading = true;

    if (await _upload()) {
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
        executives: executives,
      );

      if (isRepeated || (isAlreadyPlanned ?? false)) {
        final plannedTask = PlannedTask(
          id: _id,
          text: textController.text,
          deadline: deadline,
          isImageRequired: isImageRequired,
          updatedAt: now,
          weekdays: weekdays,
          executives: executives,
        );

        final int? id;

        switch (plannedTask.id) {
          case -1:
            final addedPlannedTasks = await db.from(PlannedTask.tableName).insert(plannedTask.toJson()).select(PlannedTask.fieldNames).withConverter(PlannedTask.converter).catchError(onError);

            id = addedPlannedTasks?.firstOrNull?.id;
          default:
            await db.from(PlannedTask.tableName).update(plannedTask.toJson()).eq($PlannedTaskImplJsonKeys.id, plannedTask.id).catchError(onError);

            await db.from(PlannedTask.executivesTableName).delete().eq($ProfileJoinImplJsonKeys.id, plannedTask.id).catchError(onError);

            id = plannedTask.id;
        }

        if (id == null) return false;

        final executivesJoins = executives.map((final Profile profile) => ProfileJoin(id: id!, profile: profile.uid).toJson()).toList();

        await db.from(PlannedTask.executivesTableName).upsert(executivesJoins).catchError(onError);

        if (isToday && isAlreadyPlanned == null) {
          if (!await _uploadTask(task)) {
            return false;
          }
        }
      } else {
        if (!await _uploadTask(task)) {
          return false;
        }
      }
      return true;
    } on Exception catch (e) {
      showSnackbar(text: e.toString(), context: _context);
      return false;
    }
  }

  Future<bool> _uploadTask(final Task task) async {
    final int? id;

    switch (task.id) {
      case -1:
        final addedTasks = await db.from(Task.tableName).insert(task.toJson()).select(Task.fieldNames).withConverter(Task.converter).catchError(onError);

        id = addedTasks?.firstOrNull?.id;
      default:
        await db.from(Task.tableName).update(task.toJson()).eq($TaskImplJsonKeys.id, task.id).catchError(onError);

        await db.from(Task.executivesTableName).delete().eq($ProfileJoinImplJsonKeys.id, task.id).catchError(onError);

        id = task.id;
    }

    if (id == null) return false;

    final newExecutives = executives.map((final Profile profile) => ProfileJoin(id: id!, profile: profile.uid).toJson()).toList();

    await db.from(Task.executivesTableName).upsert(newExecutives).catchError(onError);

    return true;
  }

  void onError() {
    showSnackbar(text: 'Beklenmeyen bir hata oluştu', context: _context);
    isUploading = false;
  }

  Future<void> delete() async {
    if (isAlreadyPlanned == null) return;
    if (_id == -1) return;

    final delete = await showDeleteDialog(itemName: 'görevi', context: _context);
    if (!delete) return;

    try {
      await db.from(isAlreadyPlanned! ? PlannedTask.tableName : Task.tableName).delete().eq($TaskImplJsonKeys.id, _id).catchError(onError);

      Navigator.pop(_context);
    } on Exception catch (e) {
      showSnackbar(text: e.toString(), context: _context);
    }
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }
}
