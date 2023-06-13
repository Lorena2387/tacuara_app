import 'package:flutter/material.dart';

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

  @override
  void dispose() {
    controllerName.dispose();
    controllerLastname.dispose();
    controllerCellphone.dispose();
    controllerEmail.dispose();
    controllerPassword.dispose();
    super.dispose();
  }
}
