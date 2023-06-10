import 'package:tacuara_app/modules/authentication_module/register_flow/data/datasources/auth_datasource.dart';

abstract class AuthRepository {
  Future<void> registerUser(String email, String password);
}

class AuthRepositoryImpl implements AuthRepository {
  final AuthDataSource authDataSource;

  AuthRepositoryImpl(this.authDataSource);

  @override
  Future<void> registerUser(String email, String password) async {
    await authDataSource.registerUser(email, password);
  }
}
