class ReservationModel {
  final String roomType;
  final String reservationNumber;
  late DateTime checkIn;
  late DateTime checkOut;
  final int totalNights;
  final int nightRate;
  final int totalRate;
  final String status;

  ReservationModel({
    required this.roomType,
    required this.checkIn,
    required this.checkOut,
    required this.totalNights,
    required this.nightRate,
    required this.totalRate,
    required this.reservationNumber,
    required this.status,
  });
  Map<String, dynamic> toJson() => {
        'roomType': roomType,
        'reservationNumber': reservationNumber,
        'checkIn': checkIn,
        'checkOut': checkOut,
        'totalNights': totalNights,
        'nightRate': nightRate,
        'totalRate': totalRate,
        'status': status,
      };
  static ReservationModel fromJson(Map<String, dynamic> json) =>
      ReservationModel(
          reservationNumber: json['reservationNumber'],
          checkIn: json['checkIn'],
          checkOut: json['checkOut'],
          totalNights: json['totalNights'],
          nightRate: json['nightRate'],
          totalRate: json['totalRate'],
          roomType: json['roomType'],
          status: json['status']);
}
