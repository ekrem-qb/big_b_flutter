import 'package:flutter/material.dart';

import '../../../../api/database.dart';
import '../../extensions/snackbar.dart';
import '../home/home_model.dart';

class Login extends ChangeNotifier {
  Login(this._context);

  static const String route = '/login';

  final BuildContext _context;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool _isPasswordVisible = false;
  bool get isPasswordVisible => _isPasswordVisible;

  void togglePasswordVisibility() {
    _isPasswordVisible = !_isPasswordVisible;
    notifyListeners();
  }

  Future<void> login() async {
    if (emailController.text.isEmpty) return;
    if (passwordController.text.isEmpty) return;

    try {
      final response = await db.auth.signInWithPassword(
        email: emailController.text,
        password: passwordController.text,
      );

      if (response.user == null) return;
      if (response.session == null) return;

      await Navigator.pushReplacementNamed(_context, Home.route);
    } on Exception catch (e) {
      showSnackbar(text: e.toString(), context: _context);
    }
  }
}
