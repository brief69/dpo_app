

// sms_verification_page.dart
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SmsVerificationPage extends StatefulWidget {
  const SmsVerificationPage({super.key});

  @override
  SmsVerificationPageState createState() => SmsVerificationPageState();
}

class SmsVerificationPageState extends State<SmsVerificationPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String _phoneNumber = '';
  String _verificationCode = '';
  String _smsCode = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SMS認証'),
        backgroundColor: const Color.fromARGB(255, 77, 4, 4),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              decoration: const InputDecoration(
                hintText: '電話番号を入力',
                prefixText: '+',
              ),
              onChanged: (value) {
                _phoneNumber = value;
              },
            ),
            ElevatedButton(
              onPressed: () async {
                await _auth.verifyPhoneNumber(
                  phoneNumber: '+$_phoneNumber',
                  verificationCompleted: (PhoneAuthCredential credential) async {
                    await _auth.signInWithCredential(credential);
                  },
                  verificationFailed: (FirebaseAuthException e) {
                  },
                  codeSent: (String verificationId, int? resendToken) {
                    _verificationCode = verificationId;
                  },
                  codeAutoRetrievalTimeout: (String verificationId) {
                    _verificationCode = verificationId;
                  },
                );
              },
              child: const Text('認証コードを送信'),
            ),
            TextField(
              decoration: const InputDecoration(
                hintText: '認証コードを入力',
              ),
              onChanged: (value) {
                _smsCode = value;
              },
            ),
            ElevatedButton(
              onPressed: () async {
                final credential = PhoneAuthProvider.credential(
                  verificationId: _verificationCode,
                  smsCode: _smsCode,
                );
                await _auth.signInWithCredential(credential);
              },
              child: const Text('認証'),
            ),
          ],
        ),
      ),
    );
  }
}

