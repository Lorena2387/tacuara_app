// class ReservationModel {
//   String reservationNumber; ok
//   DateTime checkIn; ok
//   DateTime checkOut; ok
//   String roomType; ok
//   String totalNights; ok
//   String nightRate; ok
//   String status; ok
//   String totalRate; ok
//   String name;
//   String email;
//   String cellphone;

//   ReservationModel({
//     required this.reservationNumber,
//     required this.checkIn,
//     required this.checkOut,
//     required this.roomType,
//     required this.nightRate,
//     required this.totalNights,
//     required this.status,
//     required this.totalRate,
//     required this.name,
//     required this.email,
//     required this.cellphone,
//   });

//   Map<String, dynamic> toJson() => {
//         'reservationNumber': reservationNumber,
//         'checkIn': checkIn,
//         'checkOut': checkOut,
//         'roomType': roomType,
//         'totalNights': totalNights,
//         'nightRate': nightRate,
//         'status': status,
//         'totalRate': totalRate,
//         'name': name,
//         'email': email,
//         'cellphone': cellphone,
//       };

//   static ReservationModel fromJson(Map<String, dynamic> json) =>
//       ReservationModel(
//         totalNights: json['totalNights'],
//         name: json['name'],
//         email: json['email'],
//         cellphone: json['cellphone'],
//         reservationNumber: json['referenceNumber'],
//         status: json['status'],
//         totalRate: json['totalRate'],
//         checkIn: json['checkIn'],
//         checkOut: json['checkOut'],
//         roomType: json['roomType'],
//         nightRate: json['nightRate'],
//       );
// }
