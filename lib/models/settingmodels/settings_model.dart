


// settings_model.dart
class SettingsModel {
  bool notificationsEnabled;
  bool privacyEnabled;
  bool securityEnabled;

  SettingsModel({
    this.notificationsEnabled = false,
    this.privacyEnabled = false,
    this.securityEnabled = false,
  });

  get bankAccount => null;

  get accountOpen => null;

  set accountClose(bool accountClose) {}

  set age(int age) {}

  set name(String name) {}
}

class Contact {
  String feedback;

  Contact({required this.feedback});
}
