import 'package:tacuara_app/modules/authentication_module/register_flow/data/datasources/user_datasource.dart';
import 'package:tacuara_app/modules/authentication_module/register_flow/presentation/widgets/user_exception_widget.dart';

import '../entities/user.dart';

abstract class UserRepositoryDomain {
  Future<void> createUser(
      String name, String lastname, String cellphone, String email);
}

class UserRepositoryDomainImpl implements UserRepositoryDomain {
  final UserDataSource _userDataSource;

  UserRepositoryDomainImpl(this._userDataSource);

  @override
  Future<void> createUser(
      String name, String lastname, String cellphone, String email) async {
    try {
      await _userDataSource.createUser(name, lastname, cellphone, email);
    } catch (e) {
      throw AddUserException('Error al crear la cuenta');
    }
  }

  Future<void> getUserByEmail(String email) async {
    final userData = await _userDataSource.getUserByEmail(email);

    if (userData != true) {
      return User.fromMap(userData);
    } else {
      return null;
    }
  }
}
