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

      await _authRepository.register(
        email,
        password,
      );
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
}
