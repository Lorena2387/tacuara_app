import 'package:tacuara_app/modules/authentication_module/register_flow/data/datasources/auth_datasource.dart';
import 'package:tacuara_app/modules/authentication_module/register_flow/data/repositories/user_repository.dart';

abstract class AuthRepository {
  Future<void> registerUser(String email, String password);
}

class AuthRepositoryImpl implements AuthRepository {
  final AuthDataSource authDataSource;
  final UserRepository _userRepository;

  AuthRepositoryImpl(this.authDataSource, this._userRepository);

  @override
  Future<void> registerUser(String email, String password) async {
    final existingUser = await _userRepository.
        await await authDataSource.registerUser(email, password);
  }
}
