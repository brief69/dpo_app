

// home_viewmodel.dart 
import 'package:flutter/material.dart';
import 'package:dpo/models/post.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// ViewModel for the Home page
// ホームページのためのViewModel
class HomeViewModel extends ChangeNotifier {
  // Sample posts data
  // サンプル投稿データ
  
  DateTimeRange range = DateTimeRange(
    start: DateTime.now().subtract(const Duration(days: 7)), 
    end: DateTime.now()
  );
  
  int get days => range.end.difference(range.start).inDays;

  final List<Post> _posts = [
    Post(
      caption: 'Sample caption 1',
      bounty: 100.0,
      authenticity: 8,
      harmIndex: 100,
      samePostCount: 3,
      dateRange: DateTime.now().difference(DateTime.now().subtract(const Duration(days: 7))).inDays, 
      timestamp: Timestamp.fromDate(DateTime.now()), 
      id: '', 
    ),
  ];

  // Getter to expose posts data
  // 投稿データを公開するためのGetter
  List<Post> get posts => _posts;

  // 新しいポストをリストに追加
  void addPost(Post post) {
    _posts.add(post);
    notifyListeners();  // UIを更新するためにリスナーに通知
  }

  // 特定のポストをリストから削除
  void removePost(Post post) {
    _posts.remove(post);
    notifyListeners();  // UIを更新するためにリスナーに通知
  }

  // すべてのポストをフェッチ（実際のフェッチロジックはダミーとして省略）
  Future fetchPosts() async {
    // ここでAPI呼び出しやデータベースからのデータ取得などのロジックを実装
    // ダミーとして _posts をそのまま返す
    return _posts;
  }

  // ポストのリストを更新（例: 並べ替え）
  void sortPostsByDate() {
    _posts.sort((a, b) => b.timestamp.compareTo(a.timestamp));
    notifyListeners();  // UIを更新するためにリスナーに通知
  }
}

