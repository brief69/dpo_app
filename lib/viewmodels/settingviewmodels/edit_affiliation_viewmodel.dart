

// edit_affiliation_viewmodel.dart
import 'package:flutter/material.dart';
import 'package:dpo/models/settingmodels/edit_affiliation_model.dart';


class EditAffiliationViewModel extends ChangeNotifier {
  final EditAffiliationModel _model = EditAffiliationModel();
  String? userId; // TODO:ユーザーIDを適切に設定する。
                  // firebaseから取得する？など

  Future<void> updateAffiliation(String affiliation) async {
    try {
      await _model.updateAffiliation(userId!, affiliation);
      // TODO:成功したら、所属の登録が完了しました。というダイアログを表示する
    } catch (e) {
      // TODO:エラー処理
    }
    notifyListeners();
  }
}
