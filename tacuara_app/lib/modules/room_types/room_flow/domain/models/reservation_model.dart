class ReservationModel {
  final String roomType;
  final String reservationNumber;
  late DateTime checkIn;
  late DateTime checkOut;
  late int totalNights;
  late int nightRate;
  late int totalRate;

  ReservationModel({
    required this.roomType,
    required this.checkIn,
    required this.checkOut,
    required this.totalNights,
    required this.nightRate,
    required this.totalRate,
    required this.reservationNumber,
  });
  Map<String, dynamic> toJson() => {
        'roomType': roomType,
        'reservationNumber': reservationNumber,
        'checkIn': checkIn,
        'checkOut': checkOut,
        'totalNights': totalNights,
        'nightRate': totalRate,
        'totalRate': totalRate,
      };
  static ReservationModel fromJson(Map<String, dynamic> json) =>
      ReservationModel(
          reservationNumber: json['reservationNumber'],
          checkIn: json['checkIn'],
          checkOut: json['checkOut'],
          totalNights: json['totalNights'],
          nightRate: json['nightRate'],
          totalRate: json['totalRate'],
          roomType: json['roomType']);
}
