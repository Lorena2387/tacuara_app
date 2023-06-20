import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';

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
    } catch (e) {
      throw Exception('Error al registrar al usuario');
    }
  }

  Future<String> getCurrentUserId() async {
    User? user = _firebaseAuth.currentUser;
    if (user != null) {
      return user.uid;
    } else {
      throw Exception('No se ha iniciado sesión');
    }
  }
}
