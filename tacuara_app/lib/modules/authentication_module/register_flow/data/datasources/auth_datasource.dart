import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:tacuara_app/modules/authentication_module/register_flow/data/datasources/error_type.dart';

class AuthDataSource {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<void> registerUser(
      String email, String password, BuildContext context) async {
    try {
      await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then(
        (UserCredential response) {
          if (response.user != null) {
            debugPrint(response.user?.uid.toString());
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text('Registro exitoso'),
                  content:
                      const Text('El usuario ha sido registrado exitosamente'),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text('Aceptar'),
                    ),
                  ],
                );
              },
            );
          }
        },
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-email') {
        throw Exception(AuthErrorType.invalidEmail);
      } else if (e.code == 'weak-password') {
        throw Exception(AuthErrorType.weakPassword);
      } else if (e.code == 'email-already-in-use') {
        throw Exception(AuthErrorType.emailAreadyInUse);
      } else {
        throw Exception(AuthErrorType.unexpectedError);
      }
    } catch (e) {
      throw Exception(AuthErrorType.unexpectedError);
    }
  }
}

  // Future<String> getCurrentUserId() async {
  //   User? user = _firebaseAuth.currentUser;
  //   if (user != null) {
  //     return user.uid;
  //   } else {
  //     throw Exception('No se ha iniciado sesión');
  //   }
  // }

