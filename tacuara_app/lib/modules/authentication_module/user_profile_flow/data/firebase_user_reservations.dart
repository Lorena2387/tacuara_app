import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tacuara_app/modules/room_types/room_flow/domain/models/reservation_model.dart';

class FirebaseUserReservations {
  static Stream<List<ReservationModel>> getAllReservations(
      {required String userUID}) {
    final firebase = FirebaseFirestore.instance;
    return firebase
        .collection('user')
        .doc(userUID)
        .collection("reservations")
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((document) => ReservationModel.fromJson(document.data()))
            .toList());
  }
}
