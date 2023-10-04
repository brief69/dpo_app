

// post_actions_viewmodel.dart
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class PostActionsViewModel with ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final String _postsCollection = 'posts';

  Future<void> deletePost(String postId) async {
    try {
      await _firestore.collection(_postsCollection).doc(postId).delete();
      notifyListeners();
    } catch (e) {
      ("Error deleting post: $e");
      // エラーハンドリングのコードをここに追加
      // 例：ユーザーにエラーメッセージを表示する、再試行のオプションを提供する、など
      throw Exception('Failed to delete post');
    }
  }

  Future<void> editPost(String postId, Map<String, dynamic> updatedData) async {
    try {
      await _firestore.collection(_postsCollection).doc(postId).update(updatedData);
      notifyListeners();
    } catch (e) {
      ("Error editing post: $e");
      // エラーハンドリングのコードをここに追加
      // 例：ユーザーにエラーメッセージを表示する、再試行のオプションを提供する、など
      throw Exception('Failed to edit post');
    }
  }

  Future<void> submitEvidence(String postId, List<String> evidenceFilePaths) async {
    try {
      // evidenceFilePathsを使用して何らかの処理を行う必要がある場合、ここにコードを追加
      notifyListeners();
    } catch (e) {
      ("Error submitting evidence: $e");
      // エラーハンドリングのコードをここに追加
      // 例：ユーザーにエラーメッセージを表示する、再試行のオプションを提供する、など
      throw Exception('Failed to submit evidence');
    }
  }
}
