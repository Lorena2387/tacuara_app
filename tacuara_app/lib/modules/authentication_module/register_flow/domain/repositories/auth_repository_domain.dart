import 'package:tacuara_app/modules/authentication_module/register_flow/data/datasources/auth_datasource.dart';
import 'package:tacuara_app/modules/authentication_module/register_flow/data/datasources/user_datasource.dart';
import 'package:tacuara_app/modules/authentication_module/register_flow/presentation/widgets/auth_repository_widget.dart';

abstract class AuthRepository {
  Future<void> registerUser(String email, String password);
  Future<bool> isEmailExist(String email);
}

class AuthRepositoryImpl implements AuthRepository {
  final AuthDataSource authDataSource;
  final UserDataSource _userDataSource;

  AuthRepositoryImpl(
    this.authDataSource,
    this._userDataSource,
  );

  @override
  Future<void> registerUser(String email, String password) async {
    try {
      final existingUser = await _userDataSource.getUserByEmail(email);
      if (existingUser != true) {
        throw AuthRepositoryException(
            'Ya existe un usuario registrado con este correo');
      }
    } catch (e) {
      throw AuthRepositoryException('Error al registrar el usuario: $e');
    }
  }

  @override
  Future<bool> isEmailExist(String email) {
    // TODO: implement isEmailExist
    throw UnimplementedError();
  }
}
