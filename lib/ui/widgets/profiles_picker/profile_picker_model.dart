import 'package:flutter/cupertino.dart';

import '../../../api/database.dart';
import '../../../api/entity/profile/profile.dart';
import '../extensions/snackbar.dart';

class ProfilePicker extends ChangeNotifier {
  ProfilePicker(this._context, this._excluded) {
    Future.microtask(_load);
  }

  final BuildContext _context;
  final List<Profile>? _excluded;
  final List<Profile> _selected = [];

  late final List<Profile> all;

  bool _isLoading = true;
  bool get isLoading => _isLoading;
  set isLoading(final bool value) {
    if (_isLoading == value) return;

    _isLoading = value;
    notifyListeners();
  }

  Future<void> _load() async {
    try {
      if (_excluded == null || _excluded.isEmpty) {
        all = await db.from(Profile.tableName).select(Profile.fieldNames).withConverter(Profile.converter) ?? List.empty();
      } else {
        all = await db
                .from(Profile.tableName)
                .select(Profile.fieldNames)
                .not(
                  $ProfileImplJsonKeys.uid,
                  'in',
                  '(${_excluded.map((final profile) => profile.uid).join(',')})',
                )
                .withConverter(Profile.converter) ??
            List.empty();
      }
    } on Exception catch (e) {
      all = List.empty();
      showSnackbar(text: e.toString(), context: _context);
    } finally {
      isLoading = false;
    }
  }

  bool isSelected(final int index) {
    return _selected.contains(all[index]);
  }

  void select(final int index) {
    _selected.add(all[index]);
    notifyListeners();
  }

  void unselect(final int index) {
    _selected.remove(all[index]);
    notifyListeners();
  }

  void ok() {
    Navigator.of(_context).pop(_selected);
  }
}
