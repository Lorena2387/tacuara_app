import 'package:firebase_auth/firebase_auth.dart';

class FirebaseSignOut {
  static Future<void> signOut() async {
    final firebase = FirebaseAuth.instance;
    await firebase.signOut();
  }
}
