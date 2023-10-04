

// edit_name_page.dart
import 'package:flutter/material.dart';

class EditNamePage extends StatefulWidget {
  const EditNamePage({super.key});

  @override
  EditNamePageState createState() => EditNamePageState();
}

class EditNamePageState extends State<EditNamePage> {
  final TextEditingController _nameController = TextEditingController();

  // TODO: #6 一度しか名前の登録、更新はできない。
  // この機能を実装するためには、バックエンドまたはローカルストレージが必要です。
  // 現時点ではこのコードでは省略しています。

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Name'),
        backgroundColor: const Color.fromARGB(255, 53, 0, 0),
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Enter your name'),
              style: const TextStyle(color: Colors.black),
            ),
            ElevatedButton(
              onPressed: () {
                // TODO: #4 名前を入力し、名前を更新する。
                // ここで名前を更新するロジックを書きます。
                // 例えば、Firestoreに保存する場合など。

                // 更新が成功したら、SettingsPageに戻る
                Navigator.pop(context, _nameController.text);
              },
              child: const Text('Update'),
            ),
          ],
        ),
      ),
    );
  }
}
