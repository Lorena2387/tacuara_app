import 'package:tacuara_app/modules/authentication_module/register_flow/data/datasources/user_datasource.dart';

class UserRepository {
  final UserDataSource _userDataSource;

  UserRepository(this._userDataSource);

  Future<void> createUser(
      String name, String lastname, String cellphone, String email) async {
    return _userDataSource.createUser(name, lastname, cellphone, email);
  }
}
