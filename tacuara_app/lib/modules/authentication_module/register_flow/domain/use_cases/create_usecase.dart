import 'package:tacuara_app/modules/authentication_module/register_flow/data/repositories/user_repository.dart';

class CreateUserUseCase {
  final UserRepository _userRepository;

  CreateUserUseCase(this._userRepository);

  Future<void> createUser(
      String name, String lastname, String cellphone, String email) async {}
}
