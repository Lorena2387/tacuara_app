import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tacuara_app/modules/room_types/room_flow/domain/models/reservation_model.dart';

class FirebaseCreateReservation {
  static final firebase =
      FirebaseFirestore.instance.collection('reservation').doc();

  static Future<void> newReservation(
      {required ReservationModel reservation}) async {
    await firebase.set(reservation.toJson());
  }
}
