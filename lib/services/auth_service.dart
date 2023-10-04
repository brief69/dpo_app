

// auth_service.dart
import 'package:passkeys/passkey_auth.dart';
import 'package:passkeys/relying_party_server/relying_party_server.dart';

class AuthService {
  final PasskeyAuth _auth = PasskeyAuth('http://example.com' as RelyingPartyServer);// TODO:サーバーを使うかどうか危ういが現在は例としてダミーのURLを指定している。

  Future<String?> registerWithEmail(String email) async {
    final response = await _auth.registerWithEmail(email);
    if (response != null) {
      return response.userId;
    }
    return null;
  }
}

// 説明:
// 'package:passkeys/passkey_auth.dart': 
// PasskeyAuthという外部ライブラリのクラスを使用するためのインポートです。
// このライブラリは、電子メールを使ったパスキー認証に関する機能を提供します。

// AuthServiceクラス:
// PasskeyAuth _auth: PasskeyAuthクラスのインスタンスを生成しています。
//コメントに// TODO #22:サーバーのURLを指定とあり、今後サーバーのURLを指定しなければならない。
// これは、PasskeyAuthの機能を使用するための設定や初期化がまだ完全には行われていないことを示しています。

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
