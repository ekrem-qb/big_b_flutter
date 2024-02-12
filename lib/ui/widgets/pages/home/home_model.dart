import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../api/database.dart';
import '../../../../api/entity/recording/recording.dart';
import '../login/login_model.dart';

class Home extends ChangeNotifier {
  Home(this._context) {
    _authSubscription = db.auth.onAuthStateChange.listen(_onAuthStateChange);

    Future.microtask(_load);
  }

  static const String route = '/home';

  final BuildContext _context;
  late final StreamSubscription? _authSubscription;
  final scrollController = ScrollController();

  List<Recording>? _recordings;
  List<Recording>? get recordings => _recordings;
  set recordings(final List<Recording>? value) {
    if (_recordings == value) return;

    _recordings = value;
    notifyListeners();
  }

  int? _selectedRecordingIndex;
  int? get selectedRecordingIndex => _selectedRecordingIndex;
  set selectedRecordingIndex(final int? value) {
    if (_selectedRecordingIndex == value) return;

    _selectedRecordingIndex = value;
    notifyListeners();
  }

  FutureOr _load() async {
    recordings = await db.from(Recording.tableName).select(Recording.fieldNames).order('created_at').withConverter(Recording.converter);
  }

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
