

// main.dart
// import 'package:dpo/views/homepages/home_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:dpo/viewmodels/user_viewmodel.dart';
import 'models/user.dart';
import 'views/registration_view.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final UserViewModel userViewModel = UserViewModel(); // UserViewModelのインスタンスを作成
  runApp(MyApp(userViewModel: userViewModel,)); // 作成したインスタンスをMyAppに渡す
}

class MyApp extends StatelessWidget {
  final UserViewModel userViewModel; // finalと型を指定

  // コンストラクタの修正
  const MyApp({Key? key, required this.userViewModel}) : super(key: key); 

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
            return const RegistrationView();
          }
        },
      ),
    );
  }
}
