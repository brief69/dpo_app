

// account_viewmodel.dart
import 'package:flutter/foundation.dart';

class AccountViewModel extends ChangeNotifier {
  bool _isAccountOpen = true;

  bool get isAccountOpen => _isAccountOpen;

  void toggleAccount() {
    _isAccountOpen = !_isAccountOpen;
    notifyListeners();
  }

  void deleteAccount() {}
  // TODO: ユーザーを削除する処理を実装
}

  Future<bool> logOut() async {
    // TODO: ログアウト処理を実装
    // Return true if successful, false otherwise.
    return true;  // Just a placeholder
  }

