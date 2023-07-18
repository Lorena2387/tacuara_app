import 'package:cloud_firestore/cloud_firestore.dart';

class UpdateReservation {
  static Future<void> reservationStatus({
    required String reservationID,
    required String newValue,
    required String userUID,
  }) async {
    final firebase = FirebaseFirestore.instance;
    await firebase
        .collection('reservation')
        .doc(reservationID)
        .update({'status': newValue});
    await firebase
        .collection("user")
        .doc(userUID)
        .collection("reservations")
        .doc(reservationID)
        .update({'status': newValue});
  }
}
