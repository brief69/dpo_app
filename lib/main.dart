

// main.dart
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:dpo/viewmodels/user_viewmodel.dart';
import 'package:dpo/views/homepages/home_page.dart';
import 'models/user.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp(userViewModel: null,));
}

class MyApp extends StatelessWidget {
  final UserViewModel userViewModel = UserViewModel();

  MyApp({super.key, required userViewModel});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PubOp',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: StreamBuilder<User?>(
        stream: userViewModel.userStream as Stream<User?>?,
        builder: (context, snapshot) {
          if (snapshot.hasData && snapshot.data != null) {
            // 認証済みユーザーの場合
            return const AuthorizedApp();
          } else {
            // 未認証ユーザーの場合
            return const HomePage();
          }
        },
      ),
    );
  }
}

