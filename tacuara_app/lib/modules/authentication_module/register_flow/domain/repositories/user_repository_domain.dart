import 'package:tacuara_app/modules/authentication_module/register_flow/data/datasources/auth_datasource.dart';
import 'package:tacuara_app/modules/authentication_module/register_flow/data/datasources/user_datasource.dart';
import 'package:tacuara_app/modules/authentication_module/register_flow/presentation/widgets/user_exception_widget.dart';

abstract class UserRepositoryDomain {
  Future<void> createUser(
      String name, String lastname, String cellphone, String email);
}

class UserRepositoryDomainImpl implements UserRepositoryDomain {
  final AuthDataSource _authDataSource;
  final UserDataSource _userDataSource;

  UserRepositoryDomainImpl(this._authDataSource, this._userDataSource);

  @override
  Future<void> createUser(
      String name, String lastname, String cellphone, String email) async {
    try {
      await _userDataSource.createUser(name, lastname, cellphone, email);
    } catch (e) {
      throw AddUserException('Usuario creado correctamente');
    }
  }
}
