

// edit_affiliation_model.dart
import 'package:cloud_firestore/cloud_firestore.dart';

class EditAffiliationModel {
  final CollectionReference _users = FirebaseFirestore.instance.collection('users');

  Future<void> updateAffiliation(String userId, String affiliation) async {
    return _users.doc(userId).update({'affiliation': affiliation});
  }
}
