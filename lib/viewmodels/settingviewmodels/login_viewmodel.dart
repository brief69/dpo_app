

// login_viewmodel.dart
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:logger/logger.dart';

final logger = Logger();

class LoginViewModel extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String email = '';
  String password = '';

  Future<void> logIn() async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      // TODO:ログイン成功時の処理を書く、ログイン後はhomeviewに遷移する
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        logger.e('該当するユーザーは見つかりませんでした。');
      } else if (e.code == 'wrong-password') {
        logger.e('パスワードが間違っています。');
      }
    } catch (e) {
      logger.e(e);
    }
  }
}
