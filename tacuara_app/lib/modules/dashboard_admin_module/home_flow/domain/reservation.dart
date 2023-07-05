class Reservation {
  String referenceNumber;
  DateTime checkIn;
  DateTime checkOut;
  String roomType;
  String totalRight;
  String nightRate;
  String name;
  String email;
  String cellphone;

  Reservation({
    required this.referenceNumber,
    required this.checkIn,
    required this.checkOut,
    required this.roomType,
    required this.nightRate,
    required this.totalRight,
    required this.name,
    required this.email,
    required this.cellphone,
  });

  Map<String, dynamic> toJson() => {
        'referenceNumber': referenceNumber,
        'checkIn': checkIn,
        'checkOut': checkOut,
        'roomType': roomType,
        'totalRight': totalRight,
        'nightRate': nightRate,
        'name': name,
        'email': email,
        'cellphone': cellphone,
      };

  static Reservation fromJson(Map<String, dynamic> json) => Reservation(
        totalRight: json['totalRight'],
        name: json['name'],
        email: json['email'],
        cellphone: json['cellphone'],
        referenceNumber: json['referenceNumber'],
        checkIn: json['checkIn'],
        checkOut: json['checkOut'],
        roomType: json['roomType'],
        nightRate: json['nightRate'],
      );
}
