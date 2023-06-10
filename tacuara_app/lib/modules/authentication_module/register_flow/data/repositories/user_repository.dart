import 'package:tacuara_app/modules/authentication_module/register_flow/data/datasources/user_datasource.dart';
import 'package:tacuara_app/modules/authentication_module/register_flow/presentation/widgets/user_exception_widget.dart';

class UserRepository {
  final UserDataSource _userDataSource;

  UserRepository(this._userDataSource);

  Future<void> createUser(
      String name, String lastname, String cellphone, String email) async {
    try {
      await _userDataSource.createUser(name, lastname, cellphone, email);
    } catch (e) {
      throw AddUserException('Error al agregar al usuario');
    }
  }

  Future<void> getUserByEmail(String email) async {
    final userData = await _userDataSource.getUserByEmail(email);
  }
}
