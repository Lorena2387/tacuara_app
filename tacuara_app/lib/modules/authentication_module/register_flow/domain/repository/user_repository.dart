import 'package:tacuara_app/modules/authentication_module/register_flow/domain/user_register_domain.dart';

abstract class UserRepository {
  Future<void> registerUser(UserRegisterDomain userRegisterDomain);
}
