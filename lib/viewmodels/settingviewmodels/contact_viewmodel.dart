

// contact_viewmodel.dart
import 'package:flutter/foundation.dart';
import 'package:dpo/models/settingmodels/contact_support_model.dart';

class SettingsViewModel extends ChangeNotifier {
  final ContactSupportModel _contactModel;

  SettingsViewModel(this._contactModel);

  get settings => null;

  Future<void> sendFeedback(String feedback) async {
    try {
      await _contactModel.saveFeedback(feedback);
      ("Feedback sent: $feedback");
      // TODO:成功したら、問い合わせが完了しました。というダイアログを表示する
    } catch (e) {
      // TODO:エラーハンドリング
    }
  }

  void contactViaTwitter() {
    // TODO:Twitterでの問い合わせ処理
  }

  deleteAccount() {}
}
