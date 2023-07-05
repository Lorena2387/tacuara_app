import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tacuara_app/modules/dashboard_admin_module/home_flow/domain/reservation.dart';

class GetReservations {
  Future<Reservation?> readReservation() async {
    final reservation =
        FirebaseFirestore.instance.collection('reservation').doc();
    final snapshop = await reservation.get();
    if (snapshop.exists) {
      return Reservation.fromJson(snapshop.data()!);
    }
    return null;
  }
}
