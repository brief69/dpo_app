

// affili_evidence_page.dart
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:dpo/viewmodels/settingviewmodels/affili_evidence_viewmodel.dart';


class AffiliEvidencePage extends StatefulWidget {
  final List<String> evidenceFilePaths;

  const AffiliEvidencePage({super.key, 
    required this.evidenceFilePaths, required List evidenceFileNames,
  });

  @override
  AffiliEvidencePageState createState() => AffiliEvidencePageState();
}

class AffiliEvidencePageState extends State<AffiliEvidencePage> {
  final viewModel = AffiliEvidenceViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('所属証明のエビデンスを送付')),
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
            onPressed: viewModel.uploadImageToFirebase,
            child: const Text('送信'),
          ),
        ],
      ),
    );
  }
}
