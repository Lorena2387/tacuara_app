import 'package:tacuara_app/modules/authentication_module/register_flow/domain/user_register_domain.dart';

class RegisterUserUseCase {
  final UserRepository userRepository;

  RegisterUserUseCase({required this.userRepository});

  Future<String> registerUser(String name, String lastname, String cellphone,
      String email, String password, String confimpassword) async {
    return await userRepository.registerUser(
        name, lastname, cellphone, email, password, confimpassword);
  }
}
