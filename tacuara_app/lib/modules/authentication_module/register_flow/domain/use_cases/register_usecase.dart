import 'package:tacuara_app/modules/authentication_module/register_flow/domain/repositories/auth_repository_domain.dart';

class RegisterUseCase {
  final AuthRepositoryImpl _authRepositoryImpl;

  RegisterUseCase(
    this._authRepositoryImpl,
  );

  Future<void> registerUser(String name, String lastname, String cellphone,
      String email, String password) async {
    try {
      final isEmailExist = await _authRepositoryImpl.isEmailExist(email);

      if (isEmailExist) {
        throw Exception('El correo ya está en uso, intenta con otro correo');
      } else {
        final registerUser =
            await _authRepositoryImpl.registerUser(email, password);
        return registerUser;
      }
    } catch (e) {
      throw Exception('Error al crear usuario');
    }
  }
}
