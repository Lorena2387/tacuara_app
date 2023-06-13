import 'package:tacuara_app/modules/authentication_module/register_flow/data/repositories/auth_repository.dart';
import 'package:tacuara_app/modules/authentication_module/register_flow/data/repositories/user_repository.dart';
import 'package:tacuara_app/modules/authentication_module/register_flow/provider/register_provider.dart';

class RegisterUseCase {
  final AuthRepository _authRepository;
  final UserRepository _userRepository;
  final RegisterProvider _registerProvider;

  RegisterUseCase(
    this._authRepository,
    this._registerProvider,
    this._userRepository,
  );

  Future<void> registerUser() async {
    final name = _registerProvider.controllerName.text;
    final lastname = _registerProvider.controllerLastname.text;
    final cellphone = _registerProvider.controllerCellphone.text;
    final email = _registerProvider.controllerEmail.text;
    final password = _registerProvider.controllerPassword.text;
    try {
      if (!_isValidEmail(email)) {
        throw Exception('Ingrese un correo elctrónico válido');
      }
      if (!_isValidPassword(password)) {
        throw Exception('Su contraseña debe tener 8 caracteres');
      }
      if (!_isValidName(name)) {
        throw Exception('Por favor ingrese un nombre válido');
      }
      if (!_isValidLastname(lastname)) {
        throw Exception('Por favor ingrese un apellido válido');
      }
      if (!_isValidPhoneNumber(cellphone)) {
        throw Exception('Por favor ingrese un número de celular válido');
      }

      await _authRepository.register(
        email,
        password,
      );
      await _userRepository.createUser(name, lastname, cellphone, email);
    } catch (e) {
      throw Exception('Error al registrar al usuario: $e');
    }
  }

  bool _isValidEmail(String email) {
    final emailRegex = RegExp(r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+');
    return emailRegex.hasMatch(email);
  }

  bool _isValidPassword(String password) {
    final passwordRegex = RegExp(r'^(?=.*[0-9])[a-zA-Z0-9]{8,}$');
    return passwordRegex.hasMatch(password);
  }

  bool _isValidName(String name) {
    final nameRegex = RegExp(r'^[a-zA-Z\s]{2,}$');
    return nameRegex.hasMatch(name);
  }

  bool _isValidLastname(String lastname) {
    final lastnameRegex = RegExp(r'^[a-zA-Z\s]{2,}$');
    return lastnameRegex.hasMatch(lastname);
  }

  bool _isValidPhoneNumber(String cellphone) {
    final phoneRegex = RegExp(r'^\+?[1-9]\d{1,14}$');
    return phoneRegex.hasMatch(cellphone);
  }
}
