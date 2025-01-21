class UserModel {
  String username;
  String gender;
  String location;
  String futureIdea;

  UserModel({
    required this.username,
    required this.gender,
    required this.location,
    required this.futureIdea,
  });

  Map<String, dynamic> toMap() {
    return {
      'username': username,
      'gender': gender,
      'location': location,
      'futureIdea': futureIdea,
    };
  }
}
