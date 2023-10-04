

// eqpost_viewmodel.dart
import 'package:flutter/foundation.dart';
import 'package:dpo/models/eqpost.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class EqPostViewModel with ChangeNotifier {
  List<EqPost> eq = [];

  List<EqPost> get replies => eq;

  Future<void> fetchReplies(String postId) async {
    // ここでFirebaseからpostIdに関連する派生投稿をフェッチします
    try {
      var response = await FirebaseFirestore.instance.collection('replies').where('postId', isEqualTo: postId).get();
      for (var doc in response.docs) {
      eq.add(EqPost(
      id: doc.data()['id'],
      referenceId: doc.data()['referenceId'],
      content: doc.data()['content'],
      ));
      }
      // 今回は疑似データを使います
      eq.add(EqPost(id: 'r1', referenceId: postId, content: 'This is a reply to the post.'));
      notifyListeners();
    } catch (error) {
      ("Error fetching data: $error");
      // TODO: エラーハンドリングの追加
    }
  }
}
