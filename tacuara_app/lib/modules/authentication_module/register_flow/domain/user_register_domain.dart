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
