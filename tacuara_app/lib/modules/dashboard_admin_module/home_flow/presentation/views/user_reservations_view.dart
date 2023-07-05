import 'package:flutter/material.dart';
import 'package:tacuara_app/modules/dashboard_admin_module/home_flow/presentation/widgets/reservation_card.dart';

class UserReservations extends StatefulWidget {
  const UserReservations({super.key});

  @override
  State<UserReservations> createState() => _UserReservationsState();
}

class _UserReservationsState extends State<UserReservations> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: ListView(
      children: [
        SizedBox(
          height: size.height * 0.02,
        ),
        const ReservationCardWidget(
          referenceNumber: 'F200723',
          checkIn: '20 de julio de 2023',
          checkOut: '22 de julio de 2023',
          nightRate: '\$490.000',
          roomType: 'Cabaña familiar',
          totalRate: '\$1.470.000',
          name: 'Daniel Cerquera',
          email: 'danielcerquera@gmail.com',
          cellphone: '3157394827',
          totalNight: '3',
        ),
      ],
    ));
  }
}
