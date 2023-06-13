import 'dart:js';

import 'package:flutter/src/widgets/framework.dart';
import 'package:tacuara_app/modules/authentication_module/register_flow/data/datasources/auth_datasource.dart';

class AuthRepository {
  final AuthDataSource _authDataSource;

  AuthRepository(this._authDataSource);

  Future<void> register(String email, String password) async {
    await _authDataSource.registerUser(
        email, password, context as BuildContext);
  }
}
