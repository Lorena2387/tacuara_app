import 'package:tacuara_app/modules/authentication_module/register_flow/domain/register_user_use_case.dart';
import 'package:tacuara_app/modules/authentication_module/register_flow/domain/user_register_domain.dart';

class CreateUserPresenter {
  RegisterUserUseCase registerUserUseCase;
  CreateUserPresenter({required this.registerUserUseCase});

  Future<void> createUser(String name, String lastname, String cellphone,
      String email, String password, String confirmpassword) async {
    final user = User(
        name: name,
        lastname: lastname,
        cellphone: cellphone,
        password: password,
        confirmpassword: confirmpassword);
    await registerUserUseCase.createUser(user);
  }
}
