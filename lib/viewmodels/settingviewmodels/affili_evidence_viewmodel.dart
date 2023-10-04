

// affili_evidence_viewmodel.dart

import 'package:image_picker/image_picker.dart';
import 'package:dpo/models/settingmodels/affili_evidence_model.dart';

class AffiliEvidenceViewModel {
  final model = AffiliEvidenceModel();
  final imagePicker = ImagePicker();
  PickedFile? image;

  pickImage() async {
    final pickedFile = await imagePicker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      image = pickedFile as PickedFile?;
    }
  }

  uploadImageToFirebase() async {
    if (image != null) {
      await model.saveImageToFirebase(image!);
    }
  }
}
