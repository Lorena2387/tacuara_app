import 'package:flutter/material.dart';

import '../../../../utils/images.dart';

class LoginProvider extends ChangeNotifier {
  List<String> imagesLogin = [Images.iniciosesion];
  final formKeyLogin = GlobalKey<FormState>();
  final TextEditingController controllerEmail = TextEditingController();
  final TextEditingController controllerPassword = TextEditingController();
}
