class UserModel {
  final String name;
  final String lastname;
  final String cellphone;
  final String email;

  UserModel({
    required this.name,
    required this.lastname,
    required this.cellphone,
    required this.email,
  });

  Map<String, dynamic> toJson() => {
        'name': name,
        'lastname': lastname,
        'cellphone': cellphone,
        'email': email,
      };

  static UserModel formJson(Map<String, dynamic> json) => UserModel(
        name: json['name'],
        lastname: json['lastname'],
        cellphone: json['cellphone'],
        email: json['email'],
      );
}
