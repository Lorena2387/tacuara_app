import 'package:flutter/material.dart';

class DashboardAdminProvider extends ChangeNotifier {
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
  String email = '';
}
