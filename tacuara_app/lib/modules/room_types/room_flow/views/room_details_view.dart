import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tacuara_app/modules/authentication_module/register_flow/presentation/views/user_register_view.dart';
import 'package:tacuara_app/utils/app_themes.dart';

//import 'package:tacuara_app/modules/authentication_module/register_flow/presentation/views/user_register_view.dart';

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
              // onPressed: () {
              //   if (controller.getUid().toString().isEmpty) {
              //     Navigator.push(
              //         context,
              //         MaterialPageRoute(
              //             builder: (contex) => const UserRegister()));
              //   } else {
              //     showDialog(
              //         context: context,
              //         builder: (context) => AlertDialog(
              //               title: Text('Confirma tu reserva'),
              //               content: Text(
              //                   'Tu reserva es de una habitación familiar con todo lo que incluye.'),
              //             ));
              //   }
              // },
              onPressedButton: () {},
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
                          title: const Text('Confirma tu reserva'),
                          content: Container(
                            height: size.height * 0.10,
                            width: size.width * 0.10,
                            child: ListView.builder(
                                itemCount:
                                    controller.reservationCoupleCabin.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return Container(
                                    width: size.width * 0.05,
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                          controller
                                              .reservationCoupleCabin[index],
                                          maxLines: 2,
                                          style: const TextStyle(
                                            fontSize: 12,
                                          ),
                                        ))
                                      ],
                                    ),
                                  );
                                }),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {},
                              child: const Text('Ok'),
                            ),
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
                          ],
                        );
                      });
                }
              },
              // onPressed: () {
              //   if (controller.getUid().toString().isEmpty) {
              //     Navigator.push(
              //         context,
              //         MaterialPageRoute(
              //             builder: (context) => const UserRegister()));
              //   } else {}
              // },
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