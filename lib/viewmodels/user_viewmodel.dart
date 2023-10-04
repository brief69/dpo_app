

// user_viewmodel.dart
import 'package:dpo/views/homepages/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserViewModel {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  // Firebase Authenticationの認証状態を監視するStreamを返す
  Stream<User?> get userStream => _firebaseAuth.authStateChanges();

  // サインアウトやサインインのメソッドも必要に応じて追加できます
}

class AuthorizedApp extends StatelessWidget {
  const AuthorizedApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const HomePage();
  }
}

class UnauthorizedApp extends StatelessWidget {
  const UnauthorizedApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: Text("Please log in.")));
  }
}
