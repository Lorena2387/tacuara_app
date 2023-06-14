import 'dart:js';

import 'package:flutter/foundation.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:tacuara_app/modules/authentication_module/register_flow/data/datasources/auth_datasource.dart';
import 'package:tacuara_app/modules/authentication_module/register_flow/data/datasources/user_datasource.dart';
import 'package:tacuara_app/modules/authentication_module/register_flow/domain/use_cases/register_usecase.dart';

class RegisterUseCaseProvider extends ChangeNotifier {
  final AuthDataSource _authDataSource;
  final UserDataSource _userDataSource;
  final RegisterUseCase _registerUseCase;

  RegisterUseCaseProvider(
      this._authDataSource, this._userDataSource, this._registerUseCase);

  Future<void> registerUser(String name, String lastname, String cellphone,
      String email, String password) async {
    try {
      await _authDataSource.registerUser(
          email, password, context as BuildContext);
      await _userDataSource.createUser(name, lastname, cellphone, email);
      await _registerUseCase.registerUser();
    } catch (e) {}
  }
}
