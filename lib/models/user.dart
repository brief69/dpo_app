

// user.dart
import 'package:firebase_auth/firebase_auth.dart';

class UserModel {
  Future<bool> deleteCurrentUser() async {
    try {
      await FirebaseAuth.instance.currentUser?.delete();

      return true;
    } catch (error) {
      ("Error deleting user: $error");
      return false;
    }
  }
}

class User {
  final String id;
  final String email;
  final String publicKey;

  User({required this.id, required this.email, required this.publicKey, required String name});
}

// UserModelクラス:
// deleteCurrentUserメソッド:
// Firebaseの認証サービスを使って、現在認証されているユーザーを削除するメソッド。
// メソッドは成功すればtrue、失敗すればfalseを返す。

// Userクラス:
// Userはデータモデルのクラスです。
// ユーザーのID、メールアドレス、公開キー、および名前をプロパティとして持っています。
// これはFirestoreに保存されるユーザー情報を表すためのモデルで、
// ViewModelのregisterAndCreateWalletメソッドで新しいユーザー情報をFirestoreに保存する際に使用されています。

// 全体のロジックとの関連性:
// View (registration_view.dart): ユーザーがメールアドレスを入力し、
// "Register"ボタンをクリックするとViewModelのメソッドを呼び出すUI部分。
// ViewModel (registration_viewmodel.dart): ユーザーがメールアドレスを入力し登録ボタンをクリックすると、
// このViewModelのregisterAndCreateWalletメソッドが実行されます。
// このメソッドでは:
// 1.ユーザーを認証サービスで登録します。
// 2.ウォレットを作成し、秘密キーを保存します。
// 3.作成されたウォレットの公開キーとユーザー情報をFirestoreに保存。
// ここでUserクラスのインスタンスが作成され、Firestoreに保存される。

// Model (user.dart):
// UserModel: ユーザーの削除といった操作を提供するロジックを持つ部分。
// これは、ユーザーがアカウントを削除する際に使用されます。
// User: データベースに保存するユーザー情報のモデル。ViewModelでFirestoreにユーザー情報を保存する際に使用されています。
// このアーキテクチャでは、ユーザーがメールアドレスを入力して登録ボタンをクリックすると、
// ユーザーがFirebaseの認証サービスに登録され、新しいウォレットが作成され、その情報がFirestoreに保存される。