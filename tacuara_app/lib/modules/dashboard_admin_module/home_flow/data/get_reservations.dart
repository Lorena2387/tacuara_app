import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tacuara_app/modules/room_types/room_flow/domain/models/reservation_model.dart';

class GetReservations {
  static Stream<List<ReservationModel>> getReservations() {
    final firebase = FirebaseFirestore.instance;
    return firebase.collection('reservation').snapshots().map((snapshot) =>
        snapshot.docs
            .map((document) => ReservationModel.fromJson(document.data()))
            .toList());
  }
}
