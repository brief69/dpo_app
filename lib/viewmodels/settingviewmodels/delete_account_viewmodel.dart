

// delete_account_viewmodel.dart
import 'package:dpo/models/user.dart';

class DeleteAccountViewModel {
  final _userModel = UserModel();

  Future<bool> deleteAccount() async {
    return await _userModel.deleteCurrentUser();
  }
}
