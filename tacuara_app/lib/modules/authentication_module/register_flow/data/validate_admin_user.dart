import 'package:cloud_firestore/cloud_firestore.dart';

class ValidateUser {
  static Future<List<QueryDocumentSnapshot>> getAdminUser() async {
    final firebase = FirebaseFirestore.instance;
    QuerySnapshot snapshot = await firebase.collection('admin_users').get();
    List<QueryDocumentSnapshot> documents = snapshot.docs;
    return documents;
  }
}
