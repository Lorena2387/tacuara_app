import 'package:tacuara_app/modules/authentication_module/register_flow/domain/user_register_domain.dart';

class AuthenticateAdminUseCase {
  final UserRepository _userRepository;

  AuthenticateAdminUseCase(this._userRepository);
  Future<String> registerAdmin(String name, String lastname, String cellphone,
      String email, String password, String confirmpassword) async {
    return await _userRepository.registerAdmin(
        name, lastname, cellphone, email, password, confirmpassword);
  }
}
