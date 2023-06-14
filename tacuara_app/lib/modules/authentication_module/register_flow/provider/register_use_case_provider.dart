import 'package:flutter/foundation.dart';

import 'package:tacuara_app/modules/authentication_module/register_flow/domain/use_cases/register_usecase.dart';

class RegisterUseCaseProvider extends ChangeNotifier {
  final RegisterUseCase _registerUseCase;

  RegisterUseCaseProvider(
    this._registerUseCase,
  );

  Future<void> registerUser(String name, String lastname, String cellphone,
      String email, String password) async {
    try {
      await _registerUseCase.registerUser();
    } catch (e) {}
  }
}
