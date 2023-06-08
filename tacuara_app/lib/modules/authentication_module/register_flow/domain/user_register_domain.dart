class UserRegisterDomain {
  final String name;
  final String lastname;
  final String cellphone;
  final String password;
  final String confirmpassword;
  final bool isAdmin;

  UserRegisterDomain(this.isAdmin,
      {required this.name,
      required this.lastname,
      required this.cellphone,
      required this.password,
      required this.confirmpassword});
}

abstract class UserRepository {
  Future<String> registerUser(String name, String lastname, String cellphone,
      String email, String password, String confimpassword);
  Future<String> registerAdmin(String name, String lastname, String cellphone,
      String email, String password, String confirmpassword);
}
