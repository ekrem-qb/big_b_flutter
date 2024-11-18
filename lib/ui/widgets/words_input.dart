import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

final _regExp = RegExp(r"(?:(?<=^|[^a-zA-Z0-9\u0080-\uFFFF ])'|'(?=[^a-zA-Z0-9\u0080-\uFFFF ]|$)|[^a-zA-Z0-9\u0080-\uFFFF '])+");

Future<Iterable<String>> showWordsInput(final BuildContext context) async {
  final words = await showCupertinoModalPopup<Iterable<String>>(
    context: context,
    builder: (final context) {
      return const _WordsInput();
    },
  );

  return words ?? const [];
}

class _WordsInput extends StatelessWidget {
  const _WordsInput();

  @override
  Widget build(final BuildContext context) {
    return Padding(
      padding: MediaQuery.viewInsetsOf(context),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: CupertinoPopupSurface(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Material(
                    color: Colors.transparent,
                    child: TextField(
                      autofocus: true,
                      maxLines: null,
                      keyboardType: TextInputType.text,
                      onSubmitted: (final value) => onSubmitted(value, context),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void onSubmitted(final String value, final BuildContext context) {
    final trimmedValue = value.trim();
    if (trimmedValue.isEmpty) {
      Navigator.of(context).pop();
      return;
    }
    final words = trimmedValue.split(_regExp).where((final e) => e.trim().isNotEmpty).map((final e) => e.trim());
    Navigator.of(context).pop(words);
  }
}
