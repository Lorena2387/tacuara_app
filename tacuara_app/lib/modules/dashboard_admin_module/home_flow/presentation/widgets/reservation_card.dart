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
  final String status;
  final Function onPressConfirmReservation;
  final Function onPressCancelReservation;
  final bool isAdmin;
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
    required this.status,
    required this.onPressConfirmReservation,
    required this.onPressCancelReservation,
    required this.isAdmin,
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
        border: Border.all(
          color: widget.status == "Confirmed"
              ? Colors.green
              : widget.status == "Cancelled"
                  ? Colors.red
                  : Colors.orange,
        ),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 0,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      margin: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 10,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: size.width * 0.05,
        vertical: size.height * 0.02,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
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
          cardField(
            fieldLabel: "Status",
            fieldContent: widget.status,
          ),
          cardField(
            fieldLabel: "Número de referencia",
            fieldContent: widget.referenceNumber,
          ),
          cardField(
            fieldLabel: "Check In",
            fieldContent: widget.checkIn,
          ),
          cardField(
            fieldLabel: "Check Out",
            fieldContent: widget.checkOut,
          ),
          cardField(
            fieldLabel: "Tipo de habitación",
            fieldContent: widget.roomType,
          ),
          cardField(
            fieldLabel: "Tarifa por noche",
            fieldContent: "\$${widget.nightRate}",
          ),
          cardField(
            fieldLabel: "Total noches",
            fieldContent: widget.totalNight,
          ),
          cardField(
            fieldLabel: "Valor total",
            fieldContent: "\$${widget.totalRate}",
          ),
          Visibility(
            visible: widget.isAdmin,
            child: cardField(
              fieldLabel: "Nombre del huésped",
              fieldContent: widget.name,
            ),
          ),
          Visibility(
            visible: widget.isAdmin,
            child: cardField(
              fieldLabel: "Correo del huésped",
              fieldContent: widget.email,
            ),
          ),
          Visibility(
            visible: widget.isAdmin,
            child: cardField(
              fieldLabel: "Teléfono del huésped",
              fieldContent: widget.cellphone,
            ),
          ),
          widget.isAdmin
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () => widget.onPressCancelReservation.call(),
                      child: const Text('Rechazar reserva'),
                    ),
                    TextButton(
                      onPressed: () => widget.onPressConfirmReservation.call(),
                      child: const Text('Confirmar reserva'),
                    ),
                  ],
                )
              : widget.status == "Cancelled"
                  ? const SizedBox()
                  : Center(
                      child: TextButton(
                        onPressed: () => widget.onPressCancelReservation.call(),
                        child: const Text('Cancelar reserva'),
                      ),
                    ),
        ],
      ),
    );
  }

  Widget cardField({
    required String fieldLabel,
    required String fieldContent,
  }) =>
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              fieldLabel,
              maxLines: 1,
              textAlign: TextAlign.start,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 13,
              ),
            ),
            Text(
              fieldContent,
              maxLines: 1,
              textAlign: TextAlign.start,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      );
}
