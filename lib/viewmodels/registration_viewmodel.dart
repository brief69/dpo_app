

// registration_viewmodel.dart
import 'package:dpo/services/auth_service.dart';
import 'package:dpo/services/firestore_service.dart';
import 'package:dpo/services/wallet_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:passkeys/passkeys.dart';

class RegistrationViewModel {
  final AuthService _authService = AuthService();
  final WalletService _walletService = WalletService();
  final FirestoreService firestoreService = FirestoreService();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  
  Future<void> registerAndCreateWallet(String email) async {
    try {
      final userId = await _authService.registerWithEmail(email);

      if (userId != null) {
        final wallet = await _walletService.createRandomWallet();
        // passkeysを使用して秘密キーを保存
        final passkeyManager = Passkeys('http://example.com');// TODO; サーバーのエンドポイントURLを指定する
        final passkey = await passkeyManager.createPasskey(
          id: userId,
          secret: wallet.privateKey,
          description: 'Solana Private Key'
        );

        if (passkey != null) {
          // Firestoreのトランザクションを開始
          await _firestore.runTransaction((transaction) async {
            final userRef = _firestore.collection('users').doc(userId);
            final walletRef = _firestore.collection('wallets').doc(userId);

            transaction.set(userRef, {
              'id': userId,
              'email': email,
              'publicKey': wallet.publicKey,
              // 他のUserの情報...
            });

            transaction.set(walletRef, {
              'publicKey': wallet.publicKey,
              // 他のWalletの情報...
            });
          });
        }
      }
    } catch (e) {
      ("Error during registration and wallet creation: $e");
    }
  }
}


//mvvmののRegistrationViewModelクラスを定義している。

// RegistrationViewModelクラス:
// _authService, _walletService, _firestoreService: それぞれのサービスのインスタンスを初期化している。これにより、ユーザーの登録、ウォレットの作成、Firestoreへの情報の保存を利用できるようにしている。
// registerAndCreateWalletメソッド:
// メールアドレスを使ってユーザーの登録を行い、登録後のユーザーIDを取得する。
// ユーザーIDがnullでない場合（登録に成功した場合）：ランダムなウォレットを作成する。
// passkeysを使用してウォレットの秘密キーを保存する。
// passkeyの作成が成功した場合、Firestoreにユーザー情報（メール、公開キーなど）を保存します。
// TODOコメントで、Passkeysのインスタンスを作成する際に、後でサーバーのURLを指定する必要があることを示している。

// このViewModelはユーザーの登録とウォレットの作成を主な目的としている。
// 特定の操作に従って、認証サービスを使ってユーザーを登録し、ウォレットサービスを使ってウォレットを作成し、
// さらにFirestoreサービスを使ってユーザー情報を保存する流れを持っています。