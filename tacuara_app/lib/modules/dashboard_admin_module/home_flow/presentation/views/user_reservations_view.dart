import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tacuara_app/modules/dashboard_admin_module/home_flow/data/get_reservations.dart';
import 'package:tacuara_app/modules/dashboard_admin_module/home_flow/domain/reservation.dart';
import 'package:tacuara_app/modules/dashboard_admin_module/home_flow/provider/dashboard_admin_provider.dart';

class UserReservations extends StatefulWidget {
  const UserReservations({super.key});

  @override
  State<UserReservations> createState() => _UserReservationsState();
}

class _UserReservationsState extends State<UserReservations> {
  @override
  Widget build(BuildContext context) {
    //Size size = MediaQuery.of(context).size;
    var controller = Provider.of<DashboardAdminProvider>(context, listen: true);
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
          future: controller.getReservations().first,
          builder: (context, snapshop) {
            if (snapshop.hasError) {
return const Text("Error cargando las reservas");
            }
            else if (snapshop.hasData) {
              final reservations = snapshop.data!;
              return ListView(
                children: reservations.map(buildReservation).toList();
              );
            } else {
              return const Center(child: CircularProgressIndicator(),);
            }
          }),
    );
  }

  Widget buildReservation({required ReservationModel reservation}) => Container();
  
}
