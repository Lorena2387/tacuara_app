import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tacuara_app/modules/authentication_module/register_flow/data/create_user_register.dart';
import 'package:tacuara_app/modules/authentication_module/register_flow/data/firebase_register_user.dart';
import 'package:tacuara_app/modules/authentication_module/register_flow/data/validate_admin_user.dart';
import 'package:tacuara_app/modules/authentication_module/register_flow/domain/models/firebase_authentication_exception.dart';
import 'package:tacuara_app/modules/authentication_module/register_flow/domain/models/user.dart';
import 'package:tacuara_app/utils/local_storage.dart';
//import 'package:tacuara_app/utils/local_storage.dart';

class RegisterProvider extends ChangeNotifier {
  bool termsAndConditionsCheckBoxValue = false;
  bool privacyPolicyCheckBoxValue = false;
  String userUid = '';

  final TextEditingController controllerName = TextEditingController();
  final TextEditingController controllerLastname = TextEditingController();
  final TextEditingController controllerCellphone = TextEditingController();
  final TextEditingController controllerEmail = TextEditingController();
  final TextEditingController controllerPassword = TextEditingController();
  final TextEditingController controllerConfirmPassword =
      TextEditingController();

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

  Future<void> saveUserDataRemotely(
      {required UserModel user, required String userUid}) async {
    CreateUserRegister.saveUserData(user: user, uid: userUid);
  }

  Future<void> saveUserDataLocally() async {
    await LocalStorage.setUserName('$name $lastname');
    await LocalStorage.setUserEmail(email);
    await LocalStorage.setUserPhoneNumber(cellphone);
  }

  Future<void> getUid() async {
    userUid = await LocalStorage.getUid() ?? '';
  }

  Future<List<QueryDocumentSnapshot>> getAdminUsers() async =>
      await ValidateUser.getAdminUser();

  Future<bool> validateAdminUser({required String email}) async {
    bool isAdminUser = false;
    await getAdminUsers().then(
      (documents) => documents.forEach(
        (element) {
          if (element.id == email) {
            isAdminUser = true;
          }
        },
      ),
    );
    await LocalStorage.setUserIsAdmin(isAdminUser.toString());
    return isAdminUser;
  }
}
