import 'package:flutter/widgets.dart';

import '../../../../api/database.dart';

class More extends ChangeNotifier {
  More();

  void logout() {
    db.auth.signOut();
  }
}
