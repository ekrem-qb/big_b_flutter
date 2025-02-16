import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Future<bool> showDeleteDialog({
  required final String itemName,
  required final BuildContext context,
}) async {
  return await showCupertinoDialog<bool?>(
        context: context,
        barrierDismissible: true,
        builder: (final context) => _DeleteDialog(itemName),
      ) ??
      false;
}

class _DeleteDialog extends StatelessWidget {
  const _DeleteDialog(this.itemName);
  final String itemName;

  @override
  Widget build(final BuildContext context) {
    return AlertDialog(
      icon: const Icon(Icons.delete_forever),
      title: Text('Bu $itemName silmek istediğinizden emin misiniz?'),
      actionsAlignment: MainAxisAlignment.spaceBetween,
      actions: [
        TextButton(
          child: const Text('Hayır'),
          onPressed: () => Navigator.pop(context),
        ),
        FilledButton(
          child: const Text('Evet'),
          onPressed: () => Navigator.pop(context, true),
        ),
      ],
    );
  }
}
