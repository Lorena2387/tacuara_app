import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tacuara_app/modules/authentication_module/register_flow/domain/models/firebase_authentication_exception.dart';
//import 'package:tacuara_app/modules/authentication_module/register_flow/domain/models/firebase_authentication_exception.dart';

class FirebaseRegisterUser {
  static final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  static Future<UserCredential> registerWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      return await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (error) {
      debugPrint('Firebase register failed - error code: ${error.code}');
      debugPrint('Firebase register failed - error message: ${error.message}');
      if (error.code == FirebaseSingUpException.invalidEmail) {
        throw FirebaseSingUpException.invalidEmail;
      } else if (error.code == FirebaseSingUpException.emailAlreadyInUse) {
        throw FirebaseSingUpException.emailAlreadyInUse;
      } else if (error.code == FirebaseSingUpException.weakPassword) {
        throw FirebaseSingUpException.weakPassword;
      } else if (error.code == FirebaseSingUpException.operationNotAllowed) {
        throw FirebaseSingUpException.operationNotAllowed;
      } else {
        throw FirebaseSingUpException.unexpectedError;
      }
    }
  }
}
