import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tacuara_app/modules/authentication_module/user_profile_flow/provider/profile_provider.dart';
import 'package:tacuara_app/modules/dashboard_admin_module/home_flow/presentation/widgets/reservation_card.dart';
import 'package:tacuara_app/modules/room_types/room_flow/domain/models/reservation_model.dart';

class MyReservationView extends StatefulWidget {
  const MyReservationView({super.key});

  @override
  State<MyReservationView> createState() => _MyReservationViewState();
}

class _MyReservationViewState extends State<MyReservationView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) async {
        var controller = Provider.of<ProfileProvider>(context, listen: false);
        await controller.getUid();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var controller = Provider.of<ProfileProvider>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Mis reservas",
          style: TextStyle(
            fontSize: 16,
          ),
        ),
      ),
      body: StreamBuilder<List<ReservationModel>>(
        stream: controller.getMyReservations(),
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
    var controller = Provider.of<ProfileProvider>(context, listen: true);
    return ReservationCardWidget(
      isAdmin: false,
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
      onPressConfirmReservation: () {},
      onPressCancelReservation: () {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text("¡Alerta!"),
            content: const Text(
                "¿Estas seguro que deseas cancelar esta reservación?"),
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
                child: const Text("Si, cancelar"),
              ),
            ],
          ),
        );
      },
    );
  }
}
