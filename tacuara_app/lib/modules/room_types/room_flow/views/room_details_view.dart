//import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tacuara_app/modules/authentication_module/register_flow/presentation/views/user_register_view.dart';
import 'package:tacuara_app/modules/room_types/room_flow/domain/models/reservation_model.dart';
//import 'package:tacuara_app/modules/bookings_module/calendar_flow/provider/date_picker_provider.dart';
import 'package:tacuara_app/utils/app_themes.dart';

//import 'package:tacuara_app/modules/authentication_module/register_flow/presentation/views/user_register_view.dart';

import '../../../bookings_module/calendar_flow/provider/date_picker_provider.dart';
import '../provider/room_provider.dart';
import '../widgets/cabins_widget.dart';

//import '../../../utils/images.dart';

//import '../widgets/room_details_widget.dart';

class RoomDetailsView extends StatefulWidget {
  const RoomDetailsView({super.key});

  @override
  State<RoomDetailsView> createState() => _RoomDetailsViewState();
}

class _RoomDetailsViewState extends State<RoomDetailsView> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var controller = Provider.of<RoomProvider>(context, listen: false);
    var calendarController =
        Provider.of<DatePickerProvider>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Habitaciones disponibles'),
      ),
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: ListView(
          padding: EdgeInsets.only(
            top: size.height * 0.03,
          ),
          children: [
            CabinsWidget(
              cabinImages: controller.familyCabinImages,
              title: 'Cabaña familiar',
              price: '\$490.000',
              cabinServices: controller.familyCabinServices,
              numberOfBeds: '6',
              maximumOccupancy: '10',
              onPressedButton: () {
                if (controller.getUid().toString().isEmpty) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const UserRegister()));
                } else {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text('Confirma tu reserva'),
                          content: Container(
                            height: size.height * 0.18,
                            width: size.width * 0.10,
                            child: ListView(
                              children: [
                                const Text(
                                  'Cabaña familiar',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                                SizedBox(
                                  height: size.height * 0.03,
                                ),
                                Container(
                                  width: size.width * 0.05,
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      const Icon(
                                        Icons.circle,
                                        size: 8,
                                        color: AppThemes.primaryColor,
                                      ),
                                      SizedBox(
                                        width: size.width * 0.01,
                                      ),
                                      Expanded(
                                        child: Text(
                                          'Check In: ${controller.formatDate(date: calendarController.dateTimeStart)}',
                                          maxLines: 2,
                                          style: const TextStyle(
                                            fontSize: 12,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  width: size.width * 0.05,
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      const Icon(
                                        Icons.circle,
                                        size: 8,
                                        color: AppThemes.primaryColor,
                                      ),
                                      SizedBox(
                                        width: size.width * 0.01,
                                      ),
                                      Expanded(
                                        child: Text(
                                          'Check Out: ${controller.formatDate(date: calendarController.dateTimeEnd)}',
                                          maxLines: 2,
                                          style: const TextStyle(
                                            fontSize: 12,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  width: size.width * 0.05,
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      const Icon(
                                        Icons.circle,
                                        size: 8,
                                        color: AppThemes.primaryColor,
                                      ),
                                      SizedBox(
                                        width: size.width * 0.01,
                                      ),
                                      Expanded(
                                        child: Text(
                                          'Número de noches: ${controller.calculateDays(
                                            startDate: calendarController
                                                .dateTimeStart,
                                            endDate:
                                                calendarController.dateTimeEnd,
                                          )}',
                                          maxLines: 2,
                                          style: const TextStyle(
                                            fontSize: 12,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  width: size.width * 0.05,
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      const Icon(
                                        Icons.circle,
                                        size: 8,
                                        color: AppThemes.primaryColor,
                                      ),
                                      SizedBox(
                                        width: size.width * 0.01,
                                      ),
                                      Expanded(
                                        child: Text(
                                          'Tarifa por noche: \$${controller.familyCabinRate}',
                                          maxLines: 2,
                                          style: const TextStyle(
                                            fontSize: 12,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  width: size.width * 0.05,
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      const Icon(
                                        Icons.circle,
                                        size: 8,
                                        color: AppThemes.primaryColor,
                                      ),
                                      SizedBox(
                                        width: size.width * 0.01,
                                      ),
                                      Expanded(
                                        child: Text(
                                          'Total de la reserva: \$${controller.totalRate(
                                            totalNights:
                                                controller.calculateDays(
                                              startDate: calendarController
                                                  .dateTimeStart,
                                              endDate: calendarController
                                                  .dateTimeEnd,
                                            ),
                                            dayRate: controller.familyCabinRate,
                                          )}',
                                          maxLines: 2,
                                          style: const TextStyle(
                                            fontSize: 12,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const RoomDetailsView(),
                                  ),
                                );
                              },
                              child: const Text('Cancelar'),
                            ),
                            TextButton(
                              onPressed: () {
                                controller.createReservation(
                                  reservation: ReservationModel(
                                    roomType: 'Cabaña familiar',
                                    checkIn: calendarController.dateTimeStart,
                                    checkOut: calendarController.dateTimeEnd,
                                    totalNights: controller.calculateDays(
                                      startDate:
                                          calendarController.dateTimeStart,
                                      endDate: calendarController.dateTimeEnd,
                                    ),
                                    nightRate: controller.familyCabinRate,
                                    totalRate: controller.totalRate(
                                      dayRate: controller.familyCabinRate,
                                      totalNights: controller.calculateDays(
                                        startDate:
                                            calendarController.dateTimeStart,
                                        endDate: calendarController.dateTimeEnd,
                                      ),
                                    ),
                                    reservationNumber: '',
                                  ),
                                );
                              },
                              child: const Text('Ok'),
                            ),
                          ],
                        );
                      });
                }
              },
            ),
            CabinsWidget(
              cabinImages: controller.couplesCabinImages,
              title: 'Cabaña parejas',
              price: '\$190.000',
              cabinServices: controller.couplesCabinServices,
              numberOfBeds: '1',
              maximumOccupancy: '2',
              onPressedButton: () {
                if (controller.getUid().toString().isEmpty) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const UserRegister()));
                } else {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text(
                            'Confirma tu reserva',
                          ),
                          content: Container(
                            height: size.height * 0.18,
                            width: size.width * 0.10,
                            child: ListView(
                              children: [
                                const Text(
                                  'Cabaña parejas',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                                SizedBox(
                                  height: size.height * 0.03,
                                ),
                                Container(
                                  width: size.width * 0.05,
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      const Icon(
                                        Icons.circle,
                                        size: 8,
                                        color: AppThemes.primaryColor,
                                      ),
                                      SizedBox(
                                        width: size.width * 0.01,
                                      ),
                                      Expanded(
                                        child: Text(
                                          'Check In: ${controller.formatDate(date: calendarController.dateTimeStart)}',
                                          maxLines: 2,
                                          style: const TextStyle(
                                            fontSize: 12,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  width: size.width * 0.05,
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      const Icon(
                                        Icons.circle,
                                        size: 8,
                                        color: AppThemes.primaryColor,
                                      ),
                                      SizedBox(
                                        width: size.width * 0.01,
                                      ),
                                      Expanded(
                                        child: Text(
                                          'Check Out: ${controller.formatDate(date: calendarController.dateTimeEnd)}',
                                          maxLines: 2,
                                          style: const TextStyle(
                                            fontSize: 12,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  width: size.width * 0.05,
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      const Icon(
                                        Icons.circle,
                                        size: 8,
                                        color: AppThemes.primaryColor,
                                      ),
                                      SizedBox(
                                        width: size.width * 0.01,
                                      ),
                                      Expanded(
                                        child: Text(
                                          'Número de noches: ${controller.calculateDays(
                                            startDate: calendarController
                                                .dateTimeStart,
                                            endDate:
                                                calendarController.dateTimeEnd,
                                          )}',
                                          maxLines: 2,
                                          style: const TextStyle(
                                            fontSize: 12,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  width: size.width * 0.05,
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      const Icon(
                                        Icons.circle,
                                        size: 8,
                                        color: AppThemes.primaryColor,
                                      ),
                                      SizedBox(
                                        width: size.width * 0.01,
                                      ),
                                      Expanded(
                                        child: Text(
                                          'Tarifa por noche: \$${controller.couplesCabinRate}',
                                          maxLines: 2,
                                          style: const TextStyle(
                                            fontSize: 12,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  width: size.width * 0.05,
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      const Icon(
                                        Icons.circle,
                                        size: 8,
                                        color: AppThemes.primaryColor,
                                      ),
                                      SizedBox(
                                        width: size.width * 0.01,
                                      ),
                                      Expanded(
                                        child: Text(
                                          'Total de la reserva: \$${controller.totalRate(
                                            totalNights:
                                                controller.calculateDays(
                                              startDate: calendarController
                                                  .dateTimeStart,
                                              endDate: calendarController
                                                  .dateTimeEnd,
                                            ),
                                            dayRate:
                                                controller.couplesCabinRate,
                                          )}',
                                          maxLines: 2,
                                          style: const TextStyle(
                                            fontSize: 12,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const RoomDetailsView(),
                                  ),
                                );
                              },
                              child: const Text('Cancelar'),
                            ),
                            TextButton(
                              onPressed: () {
                                controller.createReservation(
                                  reservation: ReservationModel(
                                      roomType: 'Cabaña de parejas',
                                      checkIn: calendarController.dateTimeStart,
                                      checkOut: calendarController.dateTimeEnd,
                                      totalNights: controller.calculateDays(
                                          startDate:
                                              calendarController.dateTimeStart,
                                          endDate:
                                              calendarController.dateTimeEnd),
                                      nightRate: controller.couplesCabinRate,
                                      totalRate: controller.totalRate(
                                        dayRate: controller.couplesCabinRate,
                                        totalNights: controller.calculateDays(
                                            startDate: calendarController
                                                .dateTimeStart,
                                            endDate:
                                                calendarController.dateTimeEnd),
                                      ),
                                      reservationNumber: ''),
                                );
                              },
                              child: const Text('Ok'),
                            ),
                          ],
                        );
                      });
                }
              },
            ),
            SizedBox(
              height: size.height * 0.03,
            )
          ],
        ),
      ),
    );
  }
}
