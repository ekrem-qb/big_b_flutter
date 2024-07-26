import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../api/database.dart';
import '../../extensions/snackbar.dart';
import '../app/bloc/app_bloc.dart';

class Login extends ChangeNotifier {
  Login(this._context);

  final BuildContext _context;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool _isPasswordVisible = false;
  bool get isPasswordVisible => _isPasswordVisible;

  bool _isLoggingIn = false;
  bool get isLoggingIn => _isLoggingIn;
  set isLoggingIn(final bool value) {
    if (_isLoggingIn == value) return;

    _isLoggingIn = value;
    notifyListeners();
  }

  void togglePasswordVisibility() {
    _isPasswordVisible = !_isPasswordVisible;
    notifyListeners();
  }

  Future<void> login() async {
    if (isLoggingIn) return;
    emailController.text = emailController.text.trim();
    passwordController.text = passwordController.text.trim();
    if (emailController.text.isEmpty) return;
    if (passwordController.text.isEmpty) return;

    isLoggingIn = true;

    try {
      final response = await db.auth.signInWithPassword(
        email: emailController.text,
        password: passwordController.text,
      );

      if (response.user == null) return;
      if (response.session == null) return;

      _context.read<AppBloc>().add(const AppEventSignedIn());
    } on Exception catch (e) {
      showSnackbar(text: e.toString(), context: _context);
    } finally {
      isLoggingIn = false;
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
