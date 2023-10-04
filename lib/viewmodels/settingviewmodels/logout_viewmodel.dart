

// logout_viewmodel.dart
import 'package:flutter/foundation.dart';
import 'package:dpo/models//logout_model.dart';

class LogoutViewModel extends ChangeNotifier {
  final LogoutModel _logoutModel;

  LogoutViewModel(this._logoutModel);

  Future<void> logOut() async {
    try {
      await _logoutModel.performLogout();
      // 通知を送るなどの処理
      notifyListeners();
    } catch (e) {
      // エラーハンドリング
    }
  }
}
