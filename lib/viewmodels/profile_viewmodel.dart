

// profile_viewmodel.dart
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart' as fs;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:dpo/models/profile_model.dart';

class ProfileViewModel with ChangeNotifier {
  late final fs.FirebaseFirestore firebaseFirestore = fs.FirebaseFirestore.instance; // Firestoreへの参照
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance; // FirebaseAuthへの参照
  Profile? _profile; // ユーザープロファイルデータ
  Profile? get profile => _profile; // _profileへのgetter

  // ユーザープロファイルの詳細をFirestoreから取得するメソッド
  Future<void> fetchProfileDetails() async {
    final firebaseUser = firebaseAuth.currentUser; // 現在のFirebaseユーザーを取得
    final docSnapshot = await firebaseFirestore.collection('users').doc(firebaseUser?.uid).get(); // Firestoreからユーザーデータを取得
    final data = docSnapshot.data();
    if (data != null) {
      if (data.containsKey('username') && data.containsKey('email')) {
        _profile = Profile(
          name: data['username'],
          email: data['email'],
          publicKey: data['publicKey'] ?? '',
        );
        notifyListeners(); // リスナーに変更を通知
      } else {
        // ログインまたはサインアップ画面にリダイレクト
      }
    } else {
      // ログインまたはサインアップ画面にリダイレクト
    }
  }

  // Firestoreにプロファイルデータをアップデートするメソッド
  Future<void> updateProfile(Profile profile) async {
    final firebaseUser = firebaseAuth.currentUser; // 現在のFirebaseユーザーを取得
    await firebaseFirestore.collection('users').doc(firebaseUser?.uid).set(profile.toMap(), fs.SetOptions(merge: true)); // プロファイルデータをFirestoreに保存
    notifyListeners(); // リスナーに変更を通知
  }

  // ユーザー名を更新するメソッド
  void updateUsername(String newName) {
    if (_profile != null) {
      _profile!.name = newName; // プロファイルデータを更新
      updateProfile(_profile!); // Firestoreに保存
      notifyListeners(); // リスナーに変更を通知
    } else {
      // プロファイルがNULLの場合のエラーハンドリング
    }
  }

  // プロファイルの変更を保存するメソッド
  Future<void> saveProfileChanges() async {
    if (_profile != null) {
      await updateProfile(_profile!); // Firestoreに保存
      notifyListeners(); // リスナーに変更を通知
    } else {
      // プロファイルがNULLの場合のエラーハンドリング
    }
  }
}

  

