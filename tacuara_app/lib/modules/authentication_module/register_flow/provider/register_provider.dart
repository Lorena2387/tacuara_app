import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tacuara_app/modules/authentication_module/register_flow/data/firebase_register_user.dart';
import 'package:tacuara_app/modules/authentication_module/register_flow/domain/models/firebase_authentication_exception.dart';
import 'package:tacuara_app/utils/local_storage.dart';
//import 'package:tacuara_app/utils/local_storage.dart';

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
  final TextEditingController controllerUid = TextEditingController();

  String name = '';
  String lastname = '';
  String cellphone = '';
  String email = '';
  String password = '';
  String confirmPassword = '';

  @override
  void dispose() {
    controllerName.dispose();
    controllerLastname.dispose();
    controllerCellphone.dispose();
    controllerEmail.dispose();
    controllerPassword.dispose();
    super.dispose();
  }

  Future<UserCredential> registerUser(
      {required String email, required String password}) async {
    return await FirebaseRegisterUser.registerWithEmailAndPassword(
        email: email, password: password);
  }

  String registerUserExceptionMessage({
    required String exceptionCode,
  }) {
    String message = '';
    switch (exceptionCode) {
      case FirebaseSingUpException.invalidEmail:
        message = 'Su correo no es válido.';
        break;
      case FirebaseSingUpException.emailAlreadyInUse:
        message = 'El correo ya se encuentra en uso.';
        break;
      case FirebaseSingUpException.weakPassword:
        message = 'Su contraseña es demasiado débil.';
        break;
      case FirebaseSingUpException.operationNotAllowed:
        message = 'Su operación no es permitida.';
        break;
      case FirebaseSingUpException.unexpectedError:
        message = 'Ocurrió un error inesperado.';
        break;
    }
    return message;
  }

  Future<void> saveUid({required String uid}) async {
    await LocalStorage.setUid(uid);
  }
}
