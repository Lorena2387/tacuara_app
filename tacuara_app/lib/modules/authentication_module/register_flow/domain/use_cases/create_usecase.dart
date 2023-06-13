import 'package:tacuara_app/modules/authentication_module/register_flow/data/repositories/user_repository.dart';

class CreateUserUseCase {
  final UserRepository _userRepository;

  CreateUserUseCase(this._userRepository);

  Future<void> createUser(
      String name, String lastname, String cellphone, String email) async {
    try {
      if (!_isValidName(name)) {
        throw Exception('Por favor ingrese un nombre válido');
      }
      if (!_isValidLastname(lastname)) {
        throw Exception('Por favor ingrese un apellido válido');
      }
      if (!_isValidPhoneNumber(cellphone)) {
        throw Exception('Por favor ingrese un número de celular válido');
      }
      if (!_isValidEmail(email)) {
        throw Exception('Por favor ingrese un correo electrónico válido');
      }
      await _userRepository.createUser(name, lastname, cellphone, email);
    } catch (e) {
      throw Exception('Error al registrar al usuario: $e');
    }
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

  bool _isValidEmail(String email) {
    final emailRegex = RegExp(r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+');
    return emailRegex.hasMatch(email);
  }
}
