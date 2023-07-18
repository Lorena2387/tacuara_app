import 'package:flutter/material.dart';
import 'package:tacuara_app/modules/authentication_module/user_profile_flow/data/firebase_user_reservations.dart';
import 'package:tacuara_app/modules/dashboard_admin_module/home_flow/data/update_reservation.dart';
import 'package:tacuara_app/modules/room_types/room_flow/domain/models/reservation_model.dart';
import 'package:tacuara_app/utils/local_storage.dart';

class ProfileProvider extends ChangeNotifier {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController lastnameController = TextEditingController();
  final TextEditingController cellphoneController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController identificationNumberController =
      TextEditingController();
  final TextEditingController birthdateController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  String userUid = "";

  Future<void> getUid() async {
    userUid = await LocalStorage.getUid() ?? '';
    notifyListeners();
  }

  Stream<List<ReservationModel>> getMyReservations() =>
      FirebaseUserReservations.getAllReservations(userUID: userUid);

  Future<void> cancelReservation({
    required String reservationID,
    required String userUID,
  }) async {
    UpdateReservation.reservationStatus(
      reservationID: reservationID,
      newValue: "Cancelled",
      userUID: userUID,
    );
  }
}
