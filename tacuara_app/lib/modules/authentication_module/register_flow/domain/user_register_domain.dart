class UserRegisterDomain {
  final String name;
  final String lastname;
  final String cellphone;
  final String password;
  final String confirmpassword;

  UserRegisterDomain(
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

abstract class UserRepository {
  Future<String> registerUser(String name, String lastname, String cellphone,
      String email, String password, String confimpassword);

  registerAdmin(String name, String lastname, String cellphone, String email,
      String password, String confirmpassword) {}
}

abstract class AdminRepository {
  Future<String> registerAdmin(String name, String lastname, String cellphone,
      String email, String password, String confirmpassword);
}
