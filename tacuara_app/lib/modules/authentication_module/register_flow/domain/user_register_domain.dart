class User {
  final String name;
  final String lastname;
  final String cellphone;
  final String password;
  final String confirmpassword;

  User(
      {required this.name,
      required this.lastname,
      required this.cellphone,
      required this.password,
      required this.confirmpassword});
}

class Admin {
  final String name;
  final String lastname;
  final String cellphone;
  final String email;
  final String password;
  final String confirmpassword;

  Admin({
    required this.name,
    required this.lastname,
    required this.cellphone,
    required this.email,
    required this.password,
    required this.confirmpassword,
  });
}

abstract class RegisterUserUseCase {
  Future<void> createUser(User user);
}

abstract class AuthenticateAdminUseCase {
  Future<void> createAdmin(Admin admin);
}
