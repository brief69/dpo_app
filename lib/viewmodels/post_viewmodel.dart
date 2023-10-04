

// post_viewmodel.dart
import 'package:flutter/material.dart';

class PostViewModel extends ChangeNotifier {
  String caption = "";
  String harmIndex = "";
  DateTimeRange? period;
  String bounty = "";


  void setcaption(String value) {
    caption = value;
    notifyListeners();
  }

  void setharmIndex(String value) {
    harmIndex = value;
    notifyListeners();
  }

  void setPeriod(DateTimeRange period) {
    period = period;
    notifyListeners();
  }

  void setBounty(String value) {
    bounty = value;
    notifyListeners();
  }

  // TODO: 値を取得するゲッターとバックエンドに保存するメソッドを追加
}

