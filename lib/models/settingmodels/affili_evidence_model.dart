
// affili_evidence_model.dart
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

class AffiliEvidenceModel {
  final FirebaseStorage storage = FirebaseStorage.instance;

  Future<void> saveImageToFirebase(PickedFile image) async {
    final Reference ref = storage.ref().child('evidence_images').child(DateTime.now().toIso8601String());
    final UploadTask uploadTask = ref.putFile(File(image.path));

    await uploadTask.whenComplete(() => null);
  }
}
