import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nimrapj/Models/user_model.dart';

class FormViewModel {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> saveUser(UserModel user) async {
    try {
      await _firestore.collection('users').add(user.toMap());
      print('User data saved successfully!');
    } catch (e) {
      print('Error saving user data: $e');
    }
  }
}
