import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../api/database.dart';
import '../../../../api/entity/recording/recording.dart';
import '../../extensions/snackbar.dart';
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

  late final List<Recording> recordings;
  late final RealtimeChannel? _recordingsSubscription;

  int? _selectedRecordingIndex;
  int? get selectedRecordingIndex => _selectedRecordingIndex;
  set selectedRecordingIndex(final int? value) {
    if (_selectedRecordingIndex == value) return;

    _selectedRecordingIndex = value;
    notifyListeners();
  }

  bool _isLoading = true;
  bool get isLoading => _isLoading;
  set isLoading(final bool value) {
    if (_isLoading == value) return;

    _isLoading = value;
    notifyListeners();
  }

  Future<void> _load() async {
    try {
      recordings = await db.from(Recording.tableName).select(Recording.fieldNames).order('created_at').withConverter(Recording.converter) ?? List.empty();

      _recordingsSubscription = db
          .channel(Recording.tableName)
          .onPostgresChanges(
            table: Recording.tableName,
            event: PostgresChangeEvent.all,
            callback: _onChangeRecordings,
          )
          .subscribe();
    } on Exception catch (e) {
      recordings = List.empty();
      showSnackbar(text: e.toString(), context: _context);
    } finally {
      isLoading = false;
    }
  }

  void _onAuthStateChange(final AuthState state) {
    switch (state.event) {
      case AuthChangeEvent.signedOut:
      case AuthChangeEvent.userDeleted:
        _goToLoginPage();
      default:
    }
  }

  void _onChangeRecordings(final PostgresChangePayload payload) {
    switch (payload.eventType) {
      case PostgresChangeEvent.insert:
        final newRecording = Recording.fromJson(payload.newRecord);
        for (var i = 0; i < recordings.length; i++) {
          if (newRecording.createdAt.isAfter(recordings[i].createdAt)) {
            recordings.insert(i, newRecording);
            notifyListeners();
            return;
          }
        }
      case PostgresChangeEvent.update:
        final newRecording = Recording.fromJson(payload.newRecord);
        for (var i = 0; i < recordings.length; i++) {
          if (newRecording.id == recordings[i].id) {
            recordings[i] = newRecording;
            notifyListeners();
            return;
          }
        }
      case PostgresChangeEvent.delete:
        final int id = payload.oldRecord['id'];
        for (var i = 0; i < recordings.length; i++) {
          if (id == recordings[i].id) {
            recordings.removeAt(i);
            notifyListeners();
            return;
          }
        }
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
    _recordingsSubscription?.unsubscribe();
    super.dispose();
  }
}
