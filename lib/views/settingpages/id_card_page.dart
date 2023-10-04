

// id_card_page.dart
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:dpo/viewmodels/settingviewmodels/id_card_viewmodel.dart';

class IdCardPage extends StatefulWidget {
  const IdCardPage({super.key});

  @override
  IdCardPageState createState() => IdCardPageState();
}

class IdCardPageState extends State<IdCardPage> {
  final viewModel = IdCardViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('身分証の写真を送付')),
      body: Column(
        children: [
          Expanded(
            child: viewModel.image != null 
              ? Image.file(viewModel.image! as File)
              : const Center(child: Text('画像を選択してください')),
          ),
          ElevatedButton(
            onPressed: viewModel.pickImage,
            child: const Text('画像を選択'),
          ),
          ElevatedButton(
            onPressed: viewModel.uploadImage,
            child: const Text('送信'),
          ),
        ],
      ),
    );
  }
}
