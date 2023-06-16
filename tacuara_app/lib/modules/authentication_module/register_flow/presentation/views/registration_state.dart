import 'package:flutter/material.dart';

class RegistrationState with ChangeNotifier {
  bool _isRegistering = false;

  bool get isRegistering => _isRegistering;

  void startRegistration() {
    _isRegistering = true;

    notifyListeners();
  }

  void finishRegistration() {
    _isRegistering = false;
    notifyListeners();
  }
}
