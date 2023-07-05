import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tacuara_app/modules/dashboard_admin_module/home_flow/domain/reservation.dart';

class GetReservations {
  static Future<void> listReservation(
      {required Reservation reservation}) async {
    final getReservation =
        FirebaseFirestore.instance.collection('reservation').doc();
    await getReservation.get().then((querySnapshop) {
      print('Firestore: ${querySnapshop}');
    });
  }
}
