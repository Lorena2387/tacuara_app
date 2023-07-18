import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tacuara_app/modules/dashboard_admin_module/home_flow/presentation/widgets/reservation_card.dart';
import 'package:tacuara_app/modules/dashboard_admin_module/home_flow/provider/dashboard_admin_provider.dart';
import 'package:tacuara_app/modules/room_types/room_flow/domain/models/reservation_model.dart';

class AdminReservations extends StatefulWidget {
  const AdminReservations({super.key});

  @override
  State<AdminReservations> createState() => _AdminReservationsState();
}

class _AdminReservationsState extends State<AdminReservations> {
  @override
  Widget build(BuildContext context) {
    //Size size = MediaQuery.of(context).size;
    var controller = Provider.of<DashboardAdminProvider>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Todas las reservas",
          style: TextStyle(
            fontSize: 16,
          ),
        ),
      ),
      body: StreamBuilder<List<ReservationModel>>(
        stream: controller.getReservations(),
        builder: (context, snapshop) {
          if (snapshop.hasError) {
            return Center(
              child: Text("Error cargando las reservas ${snapshop.error}"),
            );
          } else if (snapshop.hasData) {
            final reservations = snapshop.data!;
            return ListView.builder(
              itemCount: reservations.length,
              itemBuilder: (context, index) => buildReservation(
                reservation: reservations[index],
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  Widget buildReservation({required ReservationModel reservation}) {
    var controller =
        Provider.of<DashboardAdminProvider>(context, listen: false);
    return ReservationCardWidget(
      isAdmin: true,
      status: reservation.status,
      referenceNumber: reservation.reservationNumber,
      checkIn: reservation.checkIn.toIso8601String(),
      checkOut: reservation.checkOut.toIso8601String(),
      nightRate: reservation.nightRate.toString(),
      roomType: reservation.roomType,
      totalRate: reservation.totalRate.toString(),
      name: reservation.userName,
      email: reservation.userEmail,
      cellphone: reservation.userPhoneNumber,
      totalNight: reservation.totalNights.toString(),
      onPressConfirmReservation: () {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text("¡Alerta!"),
            content: const Text(
                "¿Estas seguro que deseas confirmar esta reservación?"),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text("No, regresar"),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  controller.confirmReservation(
                    reservationID:
                        "${reservation.reservationNumber}-${reservation.userUID}",
                    userUID: reservation.userUID,
                  );
                },
                child: const Text("Si, confirmar"),
              ),
            ],
          ),
        );
      },
      onPressCancelReservation: () {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text("¡Alerta!"),
            content: const Text(
                "¿Estas seguro que deseas rechazar esta reservación?"),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text("No, regresar"),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  controller.cancelReservation(
                    reservationID:
                        "${reservation.reservationNumber}-${reservation.userUID}",
                    userUID: reservation.userUID,
                  );
                },
                child: const Text("Si, rechazar"),
              ),
            ],
          ),
        );
      },
    );
  }
}
