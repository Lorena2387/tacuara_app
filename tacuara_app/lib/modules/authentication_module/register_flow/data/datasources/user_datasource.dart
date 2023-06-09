import 'package:cloud_firestore/cloud_firestore.dart';

class UserDataSource {
  final CollectionReference _userCollection =
      FirebaseFirestore.instance.collection('users');

  Future<void> createUser(
      String name, String lastname, String cellphone, String email) async {
    await _userCollection.add({
      'name': name,
      'lastname': lastname,
      'cellphone': cellphone,
      'email': email,
    });
  }
}
