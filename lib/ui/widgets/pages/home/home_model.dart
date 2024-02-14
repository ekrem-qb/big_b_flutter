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

  void _onAuthStateChange(final AuthState state) {
    switch (state.event) {
      case AuthChangeEvent.signedOut:
      case AuthChangeEvent.userDeleted:
        _goToLoginPage();
      default:
    }
  }

  void logout() {
    db.auth.signOut();
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
