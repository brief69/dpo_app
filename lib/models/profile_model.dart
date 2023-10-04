

// profile_model.dart
class Profile {
  String? name; 
  String? email; 
  String? publicKey;

  Profile({
    this.name,
    this.email, 
    required publicKey
    });
     
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'publicKey': publicKey,
    };
  }

  static Profile fromJson(Map<String, dynamic> json) {
    return Profile(
      name: json['name'],
      email: json['email'],
      publicKey: json['publicKey'],
    );
  }
}
