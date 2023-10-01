import 'package:flutter/foundation.dart';

class AppProvider with ChangeNotifier {
  String _userName = '';
  String _userHobby = '';

  String get userName {
    return _userName;
  }

  String get userHobby {
    return _userHobby;
  }

  void updateUser({
    required String newUsername,
    required String newHobby,
  }) {
    _userName = newUsername;
    _userHobby = newHobby;

    notifyListeners();
  }
}
