

// evidence_submit_page.dart
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:provider/provider.dart';
import '../../viewmodels/homeviewmodels/evidence_viewmodel.dart';

class EvidenceSubmitPage extends StatefulWidget {
  final String postId;
  const EvidenceSubmitPage({super.key, required this.postId});

  @override
  EvidenceSubmitPageState createState() => EvidenceSubmitPageState();
}

class EvidenceSubmitPageState extends State<EvidenceSubmitPage> {
  final ImagePicker _picker = ImagePicker();
  List<XFile>? _selectedFiles;

  Future<void> _pickFiles() async {
    final localContext = context; // ここでBuildContextを取得
    final pickedFiles = await _picker.pickMultiImage();

    if (pickedFiles.length + (_selectedFiles?.length ?? 0) <= 6) {
      setState(() {
        _selectedFiles = [...?_selectedFiles, ...pickedFiles];
      });
    } else {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(localContext).showSnackBar(
        const SnackBar(content: Text('最大6枚の画像・動画を選択できます。')),
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<EvidenceSubmitViewModel>(context, listen: false);
    return Scaffold(
      body: Column(
        children: [
          ...List.generate(
            6,
            (index) => GestureDetector(
              onTap: _pickFiles,
              child: _selectedFiles != null && _selectedFiles!.length > index
                  ? Image.file(File(_selectedFiles![index].path))
                  : Container(
                      height: 100, 
                      width: 100, 
                      color: Colors.white54, // 空の画像用のプレースホルダー
                    ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "運営の証拠部門にのみ送られるデータで、絶対に公開されることはありません。",
              style: TextStyle(color: Colors.white),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "画像を送信すると、運営の証拠部門に送信されます。",
              style: TextStyle(color: Colors.white),
            ),
          ),
          ElevatedButton(
            onPressed: _selectedFiles == null || _selectedFiles!.isEmpty
                ? null
                : () async {
                    final List<String> paths = _selectedFiles!.map((e) => e.path).toList();
                    try {
                      await viewModel.uploadEvidence(paths);
                      // ignore: use_build_context_synchronously
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('証拠を送信しました！')),
                      );
                    } catch (e) {
                      // ignore: use_build_context_synchronously
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('エラー: $e')),
                      );
                    }
                  },
            child: const Text("運営に証拠送信"),
          ),
        ],
      ),
    );
  }
}