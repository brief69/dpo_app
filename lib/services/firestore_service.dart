

// passkeyとpublicKeyをfirestoreに保存する
// firestore_service.dart
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dpo/models/user.dart';

class FirestoreService {
  final _usersCollection = FirebaseFirestore.instance.collection('users');

  Future<void> storeUser(User user) async {
    await _usersCollection.doc(user.id).set({
      'email': user.email,
      'publicKey': user.publicKey,
    });
  }
}
