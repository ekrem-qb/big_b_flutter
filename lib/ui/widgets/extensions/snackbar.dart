import 'package:flutter/material.dart';

void showSnackbar({required final String text, required final BuildContext context}) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));
}
