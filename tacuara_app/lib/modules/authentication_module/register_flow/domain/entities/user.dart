import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String name;
  final String lastname;
  final String cellphone;
  final String email;

  User(
    this.name,
    this.lastname,
    this.cellphone,
    this.email,
  );

  static Future<void> fromMap(DocumentSnapshot<Object?> userData) async {}
}
