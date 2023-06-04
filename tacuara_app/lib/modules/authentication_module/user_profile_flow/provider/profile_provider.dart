import 'package:flutter/material.dart';

class ProfileProvider extends ChangeNotifier {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController lastnameController = TextEditingController();
  final TextEditingController cellphoneController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController identificationNumberController =
      TextEditingController();
  final TextEditingController birthdateController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
}
