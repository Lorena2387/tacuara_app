import 'package:flutter/material.dart';
import 'package:tacuara_app/utils/images.dart';

class RecoverPasswordProvider extends ChangeNotifier {
  List<String> imagesCambiarContrasena = [
    Images.recuperarcontrasena,
  ];
  TextEditingController emailController = TextEditingController();
}
