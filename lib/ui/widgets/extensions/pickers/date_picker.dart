import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../vibration.dart';

Future<DateTime?> showCupertinoDatePicker({
  required final BuildContext context,
  required final DateTime initialDate,
  required final DateTime minimumDate,
  required final bool showDayOfWeek,
}) async {
  return showCupertinoModalPopup<DateTime?>(
    context: context,
    builder: (final context) {
      return _Widget(
        initialDate: initialDate,
        minimumDate: minimumDate,
        showDayOfWeek: showDayOfWeek,
      );
    },
  );
}

class _Model {
  _Model(this._context, this._date);

  final BuildContext _context;

  DateTime _date;

  void setDate(final DateTime value) {
    if (_date == value) return;

    _date = value;
    Vibration.vibrate();
  }

  void ok() {
    Navigator.pop(_context, _date);
  }
}

class _Widget extends StatelessWidget {
  const _Widget({
    required this.initialDate,
    required this.minimumDate,
    required this.showDayOfWeek,
  });

  final DateTime initialDate;
  final DateTime minimumDate;
  final bool showDayOfWeek;

  @override
  Widget build(final BuildContext context) {
    return Provider(
      create: (final context) => _Model(context, initialDate),
      child: _Picker(
        initialDate: initialDate,
        minimumDate: minimumDate,
        showDayOfWeek: showDayOfWeek,
      ),
    );
  }
}

class _Picker extends StatelessWidget {
  const _Picker({
    required this.initialDate,
    required this.minimumDate,
    required this.showDayOfWeek,
  });

  final DateTime initialDate;
  final DateTime minimumDate;
  final bool showDayOfWeek;

  @override
  Widget build(final BuildContext context) {
    final model = context.read<_Model>();

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: FractionallySizedBox(
              heightFactor: 0.36,
              child: CupertinoPopupSurface(
                child: CupertinoDatePicker(
                  initialDateTime: initialDate,
                  minimumDate: minimumDate,
                  showDayOfWeek: showDayOfWeek,
                  mode: CupertinoDatePickerMode.date,
                  onDateTimeChanged: model.setDate,
                ),
              ),
            ),
          ),
        ),
        MediaQuery.removePadding(
          context: context,
          removeTop: true,
          child: CupertinoActionSheet(
            actions: [
              CupertinoActionSheetAction(
                isDefaultAction: true,
                onPressed: model.ok,
                child: const Text('OK'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
