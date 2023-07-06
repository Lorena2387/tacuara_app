import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tacuara_app/modules/authentication_module/login_flow/data/firebase_login_user.dart';
import 'package:tacuara_app/modules/authentication_module/login_flow/domain/models/firebase_authentication_exception.dart';
import 'package:tacuara_app/modules/authentication_module/register_flow/data/validate_admin_user.dart';
import 'package:tacuara_app/utils/local_storage.dart';

import '../../../../utils/images.dart';

class LoginProvider extends ChangeNotifier {
  List<String> imagesLogin = [Images.iniciosesion];

  final TextEditingController controllerEmail = TextEditingController();
  final TextEditingController controllerPassword = TextEditingController();
  String email = '';
  String password = '';

  @override
  void dispose() {
    controllerEmail.dispose();
    controllerPassword.dispose();
    super.dispose();
  }

  Future loginUser({
    required String email,
    required String password,
  }) async {
    return await FirebaseLoginUser.loginWithEmailAndPassword(
        email: email, password: password);
  }

  String loginUserExceptionMessage({
    required String exceptionCode,
  }) {
    String message = '';
    switch (exceptionCode) {
      case FirebaseSingInException.userNotFound:
        message = 'Correo no encontrado';
        break;
      case FirebaseSingInException.wrongPassword:
        message = 'Contraseña incorrecta';
        break;
      case FirebaseSingInException.operationNotAllowed:
        message = 'Tu operación no es permitida';
        break;
      case FirebaseSingInException.unexpectedError:
        message = 'Ocurrio un error inesperado';
        break;
    }
    return message;
  }

  Future<void> saveUid({required String uid}) async {
    await LocalStorage.setUid(uid);
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
