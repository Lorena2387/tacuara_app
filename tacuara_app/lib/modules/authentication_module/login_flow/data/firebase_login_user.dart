import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tacuara_app/modules/authentication_module/login_flow/domain/models/firebase_authentication_exception.dart';
import 'package:tacuara_app/utils/local_storage.dart';

class FirebaseLoginUser {
  static final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  static Future<UserCredential> loginWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      return await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (error) {
      debugPrint('Firebase login failed - error code: ${error.code}');
      debugPrint('Firebase login failed - error message: ${error.message}');
      if (error.code == FirebaseSingInException.userNotFound) {
        throw FirebaseSingInException.userNotFound;
      } else if (error.code == FirebaseSingInException.wrongPassword) {
        throw FirebaseSingInException.wrongPassword;
      } else if (error.code == FirebaseSingInException.operationNotAllowed) {
        throw FirebaseSingInException.operationNotAllowed;
      } else {
        throw FirebaseSingInException.unexpectedError;
      }
    }
  }

  Future<void> saveUserUid(String uid) async {
    await LocalStorage.setUid(uid);
  }
}
