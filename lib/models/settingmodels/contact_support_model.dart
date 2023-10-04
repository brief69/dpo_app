


// contact_support_model.dart
import 'package:cloud_firestore/cloud_firestore.dart';

class ContactSupportModel {
  final _feedbackCollection = FirebaseFirestore.instance.collection('feedbacks');

  Future<void> saveFeedback(String feedback) async {
    await _feedbackCollection.add({'feedback': feedback});
  }
}
