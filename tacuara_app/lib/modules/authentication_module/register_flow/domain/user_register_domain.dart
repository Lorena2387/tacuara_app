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
