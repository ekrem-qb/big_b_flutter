import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:remove_diacritic/remove_diacritic.dart';

import '../../../api/database.dart';
import '../../../api/entity/profile/profile.dart';
import '../../../api/enums/role.dart';
import '../../../extensions/case_helpers.dart';
import '../delete_dialog.dart';
import '../extensions/snackbar.dart';

class ProfileEditor extends ChangeNotifier {
  ProfileEditor(this._context, {final Profile? originalProfile})
      : _uid = originalProfile?.uid ?? '',
        exist = originalProfile != null,
        _role = originalProfile?.role ?? Role.employee,
        nameController = TextEditingController(text: originalProfile?.name ?? ''),
        loginController = TextEditingController(text: originalProfile?.login ?? '');

  final BuildContext _context;
  final TextEditingController nameController;
  final TextEditingController loginController;
  final passwordController = TextEditingController();
  final String _uid;
  final bool exist;

  bool _isPasswordVisible = false;
  bool get isPasswordVisible => _isPasswordVisible;

  bool _isUploading = false;
  bool get isUploading => _isUploading;
  set isUploading(final bool value) {
    if (_isUploading == value) return;

    _isUploading = value;
    notifyListeners();
  }

  Role _role;
  Role get role => _role;
  set role(final Role value) {
    if (_role == value) return;

    _role = value;
    notifyListeners();
  }

  void onNameChanged(final String value) {
    if (!exist) {
      loginController.text = removeDiacritics(value).toSnakeCase();
    }
  }

  void togglePasswordVisibility() {
    _isPasswordVisible = !_isPasswordVisible;
    notifyListeners();
  }

  Future<void> save() async {
    nameController.text = nameController.text.trim();

    if (nameController.text.isEmpty) {
      showSnackbar(text: 'Ad Soyad giriniz', context: _context);
      return;
    }

    loginController.text = loginController.text.trim();

    if (loginController.text.isEmpty) {
      showSnackbar(text: 'Kullanıcı adını giriniz', context: _context);
      return;
    }

    if (!exist) {
      passwordController.text = passwordController.text.trim();

      if (passwordController.text.isEmpty) {
        showSnackbar(text: 'Şifre giriniz', context: _context);
        return;
      }
    }

    isUploading = true;

    if (await _upload()) {
      Navigator.pop(_context);
    }

    isUploading = false;
  }

  Future<bool> _upload() async {
    try {
      final profile = Profile(
        uid: _uid,
        name: nameController.text,
        createdAt: DateTime.now(),
        login: loginController.text,
        role: role,
      );

      if (!exist) {
        final json = profile.toJson();
        await db.auth.signUp(
          email: _addMail(loginController.text),
          password: passwordController.text,
          data: json,
        );
      } else {
        await db.from(Profile.tableName).update(profile.toJson()).eq($ProfileImplJsonKeys.uid, profile.uid);
      }

      return true;
    } on Exception catch (e) {
      showSnackbar(text: e.toString(), context: _context);
      return false;
    }
  }

  String _addMail(final String login) {
    if (login.contains('@')) return login;

    return '$login@${(db.auth.currentUser?.email ?? 'mail.com').split('@')[1]}';
  }

  Future<void> delete() async {
    if (!exist) return;

    final delete = await showDeleteDialog(itemName: 'çalışanı', context: _context);
    if (!delete) return;

    try {
      await db.from(Profile.tableName).update({
        $ProfileImplJsonKeys.isDeleted: true,
      }).eq($ProfileImplJsonKeys.uid, _uid);

      Navigator.pop(_context);
    } on Exception catch (e) {
      showSnackbar(text: e.toString(), context: _context);
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    loginController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
