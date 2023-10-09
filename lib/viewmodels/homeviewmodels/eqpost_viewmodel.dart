

// eqpost_viewmodel.dart
import 'package:flutter/foundation.dart';
import 'package:dpo/models/eqpost.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class EqPostViewModel with ChangeNotifier {
  List<EqPost> eq = [];

  List<EqPost> get replies => eq;

  Future<void> fetchReplies(String postId) async {
    try {
      // FirebaseからpostIdに関連する派生投稿をフェッチ
      var response = await FirebaseFirestore.instance
          .collection('replies')
          .where('postId', isEqualTo: postId)
          .get();
      eq = response.docs.map((doc) {
        // doc.data()からEqPostオブジェクトを生成
        return EqPost(
          id: doc.data()['id'],
          referenceId: doc.data()['referenceId'],
          content: doc.data()['content'],
        );
      }).toList();
      notifyListeners(); // データの変更をリスナーに通知
    } catch (error) {
      print("Error fetching data: $error");
    }
  }
}
