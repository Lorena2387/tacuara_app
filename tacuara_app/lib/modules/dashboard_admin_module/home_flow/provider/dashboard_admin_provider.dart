//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tacuara_app/modules/dashboard_admin_module/home_flow/data/get_reservations.dart';
import 'package:tacuara_app/modules/room_types/room_flow/domain/models/reservation_model.dart';

class DashboardAdminProvider extends ChangeNotifier {
  String adminUid = '';
  TextEditingController nameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController rolController = TextEditingController();
  TextEditingController postController = TextEditingController();
  TextEditingController cellphoneController = TextEditingController();

  String name = '';
  String lastname = '';
  String cellphone = '';
  String email = '';
  String password = '';
  String confirmpassword = '';

  @override
  void dispose() {
    nameController.dispose();
    lastnameController.dispose();
    cellphoneController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Stream<List<ReservationModel>> getReservations() =>
      GetReservations.getReservations();
}
