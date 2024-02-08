import 'package:flutter/material.dart';

import '../../../../api/database.dart';
import '../home/home_model.dart';

class Login extends ChangeNotifier {
  static const String route = '/login';

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Future<void> login(final BuildContext context) async {
    if (emailController.text.isEmpty) return;
    if (passwordController.text.isEmpty) return;

    try {
      final response = await db.auth.signInWithPassword(
        email: emailController.text,
        password: passwordController.text,
      );

      if (response.user == null) return;
      if (response.session == null) return;

      await Navigator.pushReplacementNamed(context, Home.route);
    } on Exception catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }
}
