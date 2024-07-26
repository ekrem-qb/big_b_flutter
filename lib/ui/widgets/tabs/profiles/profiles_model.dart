import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../api/database.dart';
import '../../../../api/entity/profile/profile.dart';
import '../../extensions/snackbar.dart';
import '../../pages/profile_editor/profile_editor_page.dart';

class Profiles extends ChangeNotifier {
  Profiles(this._context) {
    Future.microtask(_load);
  }

  final BuildContext _context;
  final scrollController = ScrollController();

  late final List<Profile> profiles;
  late final RealtimeChannel? _profilesSubscription;

  bool _isLoading = true;
  bool get isLoading => _isLoading;
  set isLoading(final bool value) {
    if (_isLoading == value) return;

    _isLoading = value;
    notifyListeners();
  }

  Future<void> _load() async {
    try {
      profiles = await db.from(Profile.tableName).select(Profile.fieldNames).neq($ProfileImplJsonKeys.isDeleted, true).order($ProfileImplJsonKeys.createdAt).withConverter(Profile.converter) ?? List.empty();

      _profilesSubscription = db
          .channel(Profile.tableName)
          .onPostgresChanges(
            table: Profile.tableName,
            event: PostgresChangeEvent.all,
            callback: _onChangeProfiles,
          )
          .subscribe();
    } on Exception catch (e) {
      profiles = List.empty();
      _profilesSubscription = null;
      showSnackbar(text: e.toString(), context: _context);
    } finally {
      isLoading = false;
    }
  }

  void _onChangeProfiles(final PostgresChangePayload payload) {
    switch (payload.eventType) {
      case PostgresChangeEvent.insert:
        final newProfile = Profile.fromJson(payload.newRecord);
        _insert(newProfile);
      case PostgresChangeEvent.update:
        final newProfile = Profile.fromJson(payload.newRecord);
        if (newProfile.isDeleted) {
          _delete(newProfile.uid);
          return;
        }
        for (var i = 0; i < profiles.length; i++) {
          if (newProfile.uid == profiles[i].uid) {
            profiles[i] = newProfile;
            notifyListeners();
            return;
          }
        }
        _insert(newProfile);
      case PostgresChangeEvent.delete:
        final String uid = payload.oldRecord[$ProfileImplJsonKeys.uid];
        _delete(uid);
      default:
    }
  }

  void _delete(final String uid) {
    for (var i = 0; i < profiles.length; i++) {
      if (uid == profiles[i].uid) {
        profiles.removeAt(i);
        notifyListeners();
        break;
      }
    }
  }

  void _insert(final Profile newProfile) {
    for (var i = 0; i < profiles.length; i++) {
      if (newProfile.createdAt.isAfter(profiles[i].createdAt)) {
        profiles.insert(i, newProfile);
        notifyListeners();
        return;
      }
    }

    profiles.add(newProfile);
    notifyListeners();
  }

  void open(final int index) {
    if (profiles.length < index) return;

    Navigator.push(
      _context,
      MaterialPageRoute(
        builder: (final context) => ProfileEditorPage(profile: profiles[index]),
      ),
    );
  }

  void newProfile() {
    Navigator.push(
      _context,
      MaterialPageRoute(
        builder: (final context) => const ProfileEditorPage(),
      ),
    );
  }

  @override
  void dispose() {
    _profilesSubscription?.unsubscribe();
    super.dispose();
  }
}
