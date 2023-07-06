import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tacuara_app/modules/room_types/room_flow/domain/models/reservation_model.dart';

class FirebaseCreateReservation {
  static Future<void> newReservation(
      {required ReservationModel reservation}) async {
    final firebase = FirebaseFirestore.instance.collection('reservation').doc();
    await firebase.set(reservation.toJson());
  }
}
