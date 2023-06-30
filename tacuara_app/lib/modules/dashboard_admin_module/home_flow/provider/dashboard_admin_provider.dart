import 'package:flutter/material.dart';

class DashboardAdminProvider extends ChangeNotifier {
  String adminUid = '';
  TextEditingController nameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController rolController = TextEditingController();
  TextEditingController postController = TextEditingController();
  TextEditingController cellphoneController = TextEditingController();

  String name = '';
  String lastname = '';
  String cellphone = '';
  String email = '';
  String password = '';
  String confirmpassword = '';

  @override
  void dispose() {
    nameController.dispose();
    lastnameController.dispose();
    cellphoneController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
