

// evidence_viewmodel.dart
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart'; // 日時のフォーマット用

class EvidenceSubmitViewModel extends ChangeNotifier {
  Future<void> uploadEvidence(List<String>? filePaths) async {
    if (filePaths == null) {
      throw Exception('証拠が選択されていません。');
    }

    for (var filePath in filePaths) {
      File file = File(filePath);
      String timestamp = DateFormat('yyyyMMddHHmmss').format(DateTime.now()); // 現在のタイムスタンプを取得
      String fileExtension = file.path.split('.').last; // ファイルの拡張子を取得

      try {
        await FirebaseStorage.instance.ref('evidence/${timestamp}_$fileExtension').putFile(file); // タイムスタンプと拡張子を使用してリファレンス名を生成
      } catch (e) {
        (e); // とりあえずエラーメッセージをログに出力
        // TODO: エラーハンドリングの追加
      }
    }
  }
}
