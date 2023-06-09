import 'package:flutter/material.dart';
import 'package:tacuara_app/modules/authentication_module/register_flow/domain/register_user_use_case.dart';

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
  late final RegisterUserUseCase registerUserUseCase;
}
