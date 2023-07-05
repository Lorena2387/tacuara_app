import 'package:flutter/material.dart';

class ReservationCardWidget extends StatefulWidget {
  final String referenceNumber;
  final String checkIn;
  final String checkOut;
  final String nightRate;
  final String roomType;
  final String totalRate;
  final String totalNight;
  final String name;
  final String email;
  final String cellphone;
  const ReservationCardWidget({
    super.key,
    required this.referenceNumber,
    required this.checkIn,
    required this.checkOut,
    required this.nightRate,
    required this.roomType,
    required this.totalRate,
    required this.name,
    required this.email,
    required this.cellphone,
    required this.totalNight,
  });

  @override
  State<ReservationCardWidget> createState() => _ReservationCardWidgetState();
}

class _ReservationCardWidgetState extends State<ReservationCardWidget> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            spreadRadius: 0,
            blurRadius: 8,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      margin: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 10,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
          ),
          SizedBox(
            height: size.height * 0.01,
          ),
          Text('Número de referencia: ${widget.referenceNumber}'),
          SizedBox(
            height: size.height * 0.01,
          ),
          Text('Check In: ${widget.checkIn}'),
          SizedBox(
            height: size.height * 0.01,
          ),
          Text('Check Out: ${widget.checkOut}'),
          SizedBox(
            height: size.height * 0.01,
          ),
          Text('Tipo de habitación: ${widget.roomType}'),
          SizedBox(
            height: size.height * 0.01,
          ),
          Text('Total noche: ${widget.nightRate}'),
          SizedBox(
            height: size.height * 0.01,
          ),
          Text('Valor total: ${widget.totalRate}'),
          SizedBox(
            height: size.height * 0.01,
          ),
          Text('Total noches: ${widget.totalNight}'),
          SizedBox(
            height: size.height * 0.01,
          ),
          Text('Nombre: ${widget.name}'),
          SizedBox(
            height: size.height * 0.01,
          ),
          Text('Correo electrónico: ${widget.email}'),
          SizedBox(
            height: size.height * 0.01,
          ),
          Text('Celular: ${widget.cellphone}'),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {},
                child: const Text('Rechazar reserva'),
              ),
              TextButton(
                onPressed: () {},
                child: const Text('Confirmar reserva'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
