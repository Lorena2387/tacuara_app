import 'dart:js';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tacuara_app/modules/authentication_module/register_flow/data/datasources/error_type.dart';

class RegisterProvider extends ChangeNotifier {
  bool termsAndConditionsCheckBoxValue = false;
  bool privacyPolicyCheckBoxValue = false;

  final TextEditingController controllerName = TextEditingController();
  final TextEditingController controllerLastname = TextEditingController();
  final TextEditingController controllerCellphone = TextEditingController();
  final TextEditingController controllerEmail = TextEditingController();
  final TextEditingController controllerPassword = TextEditingController();
  final TextEditingController controllerConfirmPassword =
      TextEditingController();

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  void dispose() {
    controllerName.dispose();
    controllerLastname.dispose();
    controllerCellphone.dispose();
    controllerEmail.dispose();
    controllerPassword.dispose();
    super.dispose();
  }

  void _showSuccessSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text(
        'Registro exitoso',
      ),
      duration: Duration(seconds: 2),
    ));
  }

  Future<void> registerUser() async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: controllerEmail.text, password: controllerPassword.text);
      _showSuccessSnackBar(context as BuildContext);
    } catch (e) {
      if (e is Exception) {
        throw _getErrorMessage(e);
      }
    }
  }

  // String _getErrorMessage(Exception error) {
  //   switch (error) {
  //     case AuthErrorType.invalidEmail:
  //       return 'Email invalido';
  //     case AuthErrorType.weakPassword:
  //       return 'Contraseña debil';
  //     case AuthErrorType.emailAreadyInUse:
  //       return 'El email ya está en uso';
  //   }
  // }
}
