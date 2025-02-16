import 'package:flutter/material.dart';

class ErrorPanel extends StatelessWidget {
  const ErrorPanel({required this.error, required this.onRefresh, super.key});

  final String error;
  final void Function() onRefresh;

  @override
  Widget build(final BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.error_outline_rounded, size: 64),
          Padding(
            padding: const EdgeInsets.all(32),
            child: Text(
              error,
              maxLines: 4,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          ElevatedButton.icon(
            onPressed: onRefresh,
            icon: const Icon(Icons.refresh_rounded),
            label: const Text('Yenile'),
          ),
        ],
      ),
    );
  }
}
