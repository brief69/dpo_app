

// id_card_viewmodel.dart

import 'package:image_picker/image_picker.dart';
import 'package:dpo/models/settingmodels/id_card_model.dart';

class IdCardViewModel {
  final model = IdCardModel();
  final imagePicker = ImagePicker();
  PickedFile? image;

  pickImage() async {
    final pickedFile = await imagePicker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      image = pickedFile as PickedFile?;
    }
  }

  uploadImage() async {
    if (image != null) {
      await model.saveImage(image!);
    }
  }
}
