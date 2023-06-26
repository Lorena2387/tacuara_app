import 'dart:html';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FirebaseLoginUser {
  static final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  static Future loginWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      return await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (error) {
      debugPrint('Firebase login failed -error code: ${error.code}');
    }
  }
}
