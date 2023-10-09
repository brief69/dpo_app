

// auth_service.dart
import 'package:passkeys/passkey_auth.dart';
import 'package:passkeys/relying_party_server/relying_party_server.dart';

class AuthService {
  final PasskeyAuth _auth = PasskeyAuth(RelyingPartyServer as RelyingPartyServer);

  Future<String?> registerWithEmail(String email) async {
    final response = await _auth.registerWithEmail(email);
    if (response != null) {
      return response.userId;
    }
    return null;
  }
}


// AuthServiceクラス:
// PasskeyAuth _auth: PasskeyAuthクラスのインスタンスを生成。

// registerWithEmailメソッド:
// このメソッドは、電子メールアドレスを引数に取り、そのメールアドレスを使用してユーザーを登録します。
// 内部で、_auth.registerWithEmail(email)を呼び出して、PasskeyAuthライブラリのregisterWithEmailメソッドを使用しています。
// レスポンスがnullでない場合、response.userIdを返しています。これは登録されたユーザーのIDを示しています。
// レスポンスがnullの場合、nullを返します。

// 全体のロジックとの関連性:
// このAuthServiceクラスは、ユーザーの認証を行うためのサービスとして定義されています。
// 具体的には、ユーザーのメールアドレスを使ってパスキー認証の登録を行います。
// registration_viewmodel.dartの中でこのregisterWithEmailメソッドが使用されており、
// ユーザーが登録ボタンをクリックした際にこの認証サービスを通じてメールアドレスでの登録が行われます。
