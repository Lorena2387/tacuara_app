import 'dart:js';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:tacuara_app/modules/authentication_module/register_flow/data/datasources/auth_datasource.dart';
import 'package:tacuara_app/modules/authentication_module/register_flow/presentation/widgets/dialog_widget.dart';

class AuthRepository {
  final AuthDataSource _authDataSource;

  AuthRepository(this._authDataSource);

  Future<void> register(String email, String password) async {
    try {
      await _authDataSource.registerUser(email, password);
    } catch (e) {
      if (e is FirebaseAuthException) {
        if (e.code == 'email-already-in-use') {
          DialogWidget.showEmailAlreadyInUseDialog(context as BuildContext);
        }
      }
    }
  }
}
