import 'package:flutter/material.dart';

import 'extensions/fade_transition_builder.dart';

class SaveButton extends StatelessWidget {
  const SaveButton({
    required this.isLoading,
    required this.onPressed,
    super.key,
  });

  final bool isLoading;
  final Function() onPressed;

  @override
  Widget build(final BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 500),
        transitionBuilder: fadeTransitionBuilder,
        child: isLoading
            ? const LinearProgressIndicator(
                minHeight: 56,
                borderRadius: BorderRadius.all(Radius.circular(16)),
              )
            : FractionallySizedBox(
                widthFactor: 1,
                child: FloatingActionButton.extended(
                  icon: const Icon(Icons.save),
                  label: const Text('Kaydet'),
                  onPressed: onPressed,
                ),
              ),
      ),
    );
  }
}
