import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../vibration.dart';

Future<Duration?> showCupertinoTimePicker({
  required final BuildContext context,
  required final Duration initialTime,
}) async {
  return showCupertinoModalPopup<Duration?>(
    context: context,
    builder: (final context) {
      return _Widget(initialTime: initialTime);
    },
  );
}

class _Model {
  _Model(this._context, this._date);

  final BuildContext _context;

  Duration _date;

  void setTime(final Duration value) {
    if (_date == value) return;

    _date = value;
    Vibration.vibrate();
  }

  void ok() {
    Navigator.pop(_context, _date);
  }
}

class _Widget extends StatelessWidget {
  const _Widget({required this.initialTime});

  final Duration initialTime;

  @override
  Widget build(final BuildContext context) {
    return Provider(
      create: (final context) => _Model(context, initialTime),
      child: _Picker(initialTime: initialTime),
    );
  }
}

class _Picker extends StatelessWidget {
  const _Picker({required this.initialTime});

  final Duration initialTime;

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
                child: CupertinoTimerPicker(
                  mode: CupertinoTimerPickerMode.hm,
                  initialTimerDuration: initialTime,
                  onTimerDurationChanged: model.setTime,
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
