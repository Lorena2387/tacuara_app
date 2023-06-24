import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tacuara_app/modules/authentication_module/register_flow/data/firebase_register_user.dart';
import 'package:tacuara_app/modules/authentication_module/register_flow/domain/models/firebase_authentication_exception.dart';

class RegisterProvider extends ChangeNotifier {
  bool termsAndConditionsCheckBoxValue = false;
  bool privacyPolicyCheckBoxValue = false;
  final formKey = GlobalKey<FormState>();

  final TextEditingController controllerName = TextEditingController();
  final TextEditingController controllerLastname = TextEditingController();
  final TextEditingController controllerCellphone = TextEditingController();
  final TextEditingController controllerEmail = TextEditingController();
  final TextEditingController controllerPassword = TextEditingController();
  final TextEditingController controllerConfirmPassword =
      TextEditingController();

  @override
  void dispose() {
    controllerName.dispose();
    controllerLastname.dispose();
    controllerCellphone.dispose();
    controllerEmail.dispose();
    controllerPassword.dispose();
    super.dispose();
  }

  Future<UserCredential?> registerUser(
      {required String email, required String password}) async {
    if (formKey.currentState!.validate() &&
        termsAndConditionsCheckBoxValue &&
        privacyPolicyCheckBoxValue) {
      return await FirebaseRegisterUser.registerWithEmailAndPassword(
          email: email, password: password);
    } else {
      return null;
    }
  }

  String registerUserExceptionMessage({
    required String exceptionCode,
  }) {
    String message = '';
    switch (exceptionCode) {
      case FirebaseAuthenticationException.invalidEmail:
        message = 'Su correo no es válido.';
        break;
      case FirebaseAuthenticationException.emailAlreadyInUse:
        message = 'El correo ya se encuentra en uso.';
        break;
      case FirebaseAuthenticationException.weakPassword:
        message = 'Su contraseña es demasiado débil.';
        break;
      case FirebaseAuthenticationException.operationNotAllowed:
        message = 'Su operación no es permitida.';
        break;
      case FirebaseAuthenticationException.unexpectedError:
        message = 'Ocurrió un error inesperado.';
        break;
    }
    return message;
  }
}
