import 'package:flutter/material.dart';
import 'package:tacuara_app/utils/images.dart';

class ChangePasswordProvider extends ChangeNotifier {
  List<String> imagesCambiarContrasena = [
    Images.cambiarcontrasena,
  ];
  TextEditingController oldPassController = TextEditingController();
  TextEditingController newPassController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();
}
