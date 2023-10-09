

// edit_post_viewmodel.dart

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class EditPostViewModel with ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> savePost(String postId, String updatedContent) async {
    try {
      await _firestore.collection('posts').doc(postId).update({'content': updatedContent});
      notifyListeners();
    } catch (e) {
      (e.toString());
    }
  }
}
