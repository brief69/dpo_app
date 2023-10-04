

// delete_account_page.dart
import 'package:flutter/material.dart';
import 'package:dpo/viewmodels/settingviewmodels/delete_account_viewmodel.dart';


class DeleteAccountPage extends StatefulWidget {
  const DeleteAccountPage({super.key});

  @override
  DeleteAccountPageState createState() => DeleteAccountPageState();
}

class DeleteAccountPageState extends State<DeleteAccountPage> {
  final _viewModel = DeleteAccountViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Delete Account")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text("本当にアカウントを削除しますか？この操作は取り消せません。"),
            ElevatedButton(
              child: const Text("OK"),
              onPressed: () async {
                bool success = await _viewModel.deleteAccount();
                if (success) {
                  // ignore: use_build_context_synchronously
                  Navigator.pushReplacementNamed(context, '/login');
                }
              },
            ),
            ElevatedButton(
              child: const Text("キャンセル"),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        ),
      ),
    );
  }
}
