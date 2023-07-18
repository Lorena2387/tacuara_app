import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tacuara_app/modules/room_types/room_flow/domain/models/reservation_model.dart';

class FirebaseCreateReservation {
  static Future<void> newReservation(
      {required ReservationModel reservation}) async {
    final firebase = FirebaseFirestore.instance
        .collection('reservation')
        .doc("${reservation.reservationNumber}-${reservation.userUID}");
    final userProfile = FirebaseFirestore.instance
        .collection("user")
        .doc(reservation.userUID)
        .collection("reservations")
        .doc("${reservation.reservationNumber}-${reservation.userUID}");
    await firebase.set(reservation.toJson());
    await userProfile.set(reservation.toJson());
  }
}
