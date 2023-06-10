import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tacuara_app/modules/authentication_module/register_flow/presentation/widgets/user_exception_widget.dart';

class UserDataSource {
  final CollectionReference _userCollection =
      FirebaseFirestore.instance.collection('users');

  Future<void> createUser(
    String name,
    String lastname,
    String cellphone,
    String email,
  ) async {
    try {
      final requestData = jsonEncode({
        'name': name,
        'lastname': lastname,
        'cellphone': cellphone,
        'email': email,
      });
      await _userCollection.doc().set(jsonDecode(requestData));
    } catch (e) {
      throw AddUserException('Error al agregar usuario');
    }
  }

  Future<DocumentSnapshot> getUserByEmail(String email) async {
    return await _userCollection.doc(email).get();
  }
}
