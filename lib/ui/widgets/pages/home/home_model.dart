import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../api/database.dart';
import '../login/login_model.dart';

class Home extends ChangeNotifier {
  Home(this._context) {
    _authSubscription = db.auth.onAuthStateChange.listen(_onAuthStateChange);
  }

  static const String route = '/home';

  final BuildContext _context;
  late final StreamSubscription? _authSubscription;

  int _selectedTabIndex = 0;
  int get selectedTabIndex => _selectedTabIndex;

  void setSelectedTabIndex(final int value) {
    if (_selectedTabIndex == value) return;

    _selectedTabIndex = value;
    notifyListeners();
  }

  void _onAuthStateChange(final AuthState state) {
    switch (state.event) {
      case AuthChangeEvent.signedOut:
      case AuthChangeEvent.userDeleted:
        _goToLoginPage();
      default:
    }
  }

  void _goToLoginPage() {
    Navigator.pushReplacementNamed(_context, Login.route);
  }

  @override
  void dispose() {
    _authSubscription?.cancel();
    super.dispose();
  }
}
