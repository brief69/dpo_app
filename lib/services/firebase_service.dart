

// firebase_service.dart
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/post.dart';

class FirebaseService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Stream<List<Post>> getPosts() {
    return _db.collection('posts').snapshots().map((snapshot) =>
        snapshot.docs.map((doc) => Post.fromJson(doc.data())).toList());
  }

  Future<void> addPost(Post post) async {
    await _db.collection('posts').add({
      'authenticity': post.authenticity,
      'caption': post.caption,
      'harmIndex': post.harmIndex,
      'dateRange': post.dateRange,
      'bounty': post.bounty,
      'timestamp': post.timestamp,
    });
  }
}

// Firebase Cloud Firestoreとの間のデータ操作を中心に処理するFirebaseServiceクラス定義
// 特にpostsコレクションに関するデータの取得や追加のためのメソッド提供

// Firestoreから取得するポストのデータ構造を定義

// FirebaseServiceクラス:
// FirebaseFirestore _db: FirebaseFirestoreのインスタンスを作成して、
// Firestoreとのインタラクションのための主要なエントリーポイントを提供しています。

// getPostsメソッド:
// postsという名前のコレクションからデータのスナップショット（即時のデータの状態）をストリームとして取得します。
// 取得したスナップショットの中のドキュメントをPostモデルに変換して、Postオブジェクトのリストとして返します。
// このメソッドは、アプリケーション内でpostsのリアルタイムの変更を監視する場合に使用される。

// addPostメソッド:
// 引数としてPostオブジェクトを取り、そのオブジェクトのデータをFirestoreのpostsコレクションに追加します。
// ここでは、Postオブジェクトのプロパティを明示的にFirestoreのドキュメントのフィールドとして設定しています。

// 総合:
// このFirebaseServiceクラスは、Firestoreのpostsコレクションとの間のデータ操作を行うサービスとして機能しています。
// アプリケーション内で、ポストのデータをリアルタイムで取得したり、新しいポストを追加したりする場合にこのクラスのメソッドが使用されることになります。
