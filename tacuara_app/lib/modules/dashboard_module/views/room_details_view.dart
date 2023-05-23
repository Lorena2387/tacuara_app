import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tacuara_app/modules/dashboard_module/widgets/cabins_widget.dart';

import 'package:tacuara_app/modules/dashboard_module/widgets/room_details_widget.dart';
import 'package:tacuara_app/utils/app_themes.dart';

//import '../../../utils/images.dart';
import '../dashboard_provider.dart';
//import '../widgets/room_details_widget.dart';

class RoomDetailsView extends StatefulWidget {
  const RoomDetailsView({super.key});

  @override
  State<RoomDetailsView> createState() => _RoomDetailsViewState();
}

class _RoomDetailsViewState extends State<RoomDetailsView> {
  List<String> cabanafamiliar = [
    'Desayuno',
    'servicio de piscina',
    'Parqueadero privado cubierto',
    'Wifi',
    'Televisión',
    'Baño privado',
    'Cama doble',
    'Camarote',
    'Cama auxiliar',
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var controller = Provider.of<DashboardProvider>(context, listen: false);
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
            Card(
              color: Colors.white,
              elevation: 20,
              margin: const EdgeInsets.symmetric(
                horizontal: 8,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10)),
                    child: Stack(
                      children: [
                        CarouselSlider(
                          options: CarouselOptions(
                            aspectRatio: 16 / 9,
                            autoPlay: true,
                            autoPlayCurve: Curves.linear,
                            viewportFraction: 1,
                            enlargeStrategy: CenterPageEnlargeStrategy.zoom,
                          ),
                          items: controller.familyCabinImages
                              .map(
                                (image) => AspectRatio(
                                  aspectRatio: 16 / 9,
                                  child: ClipRRect(
                                    child: Image.asset(
                                      image,
                                      fit: BoxFit.fitWidth,
                                    ),
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Column(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(5),
                                  decoration: const BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                  child: const Text(
                                    ' \$490.000',
                                    textAlign: TextAlign.center,
                                    style:
                                        TextStyle(fontWeight: FontWeight.w700),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  const Text(
                    'Cabaña familiar',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  GridView.builder(
                    padding: const EdgeInsets.all(22),
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: controller.familyCabinServices.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 10 / 2,
                      mainAxisSpacing: size.height * 0.01,
                      crossAxisSpacing: size.width * 0.02,
                      crossAxisCount: 2,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        width: size.width * 0.05,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Icon(
                              Icons.circle,
                              size: 10,
                              color: AppThemes.primaryColor,
                            ),
                            SizedBox(
                              width: size.width * 0.01,
                            ),
                            Expanded(
                              child: Text(
                                controller.familyCabinServices[index],
                                maxLines: 2,
                                style: const TextStyle(fontSize: 12),
                              ),
                            )
                          ],
                        ),
                      );
                    },
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.bed,
                        size: 18,
                        color: AppThemes.primaryColor,
                      ),
                      const Text(': 6'),
                      SizedBox(
                        width: size.width * 0.02,
                      ),
                      const Icon(
                        Icons.group,
                        size: 18,
                        color: AppThemes.primaryColor,
                      ),
                      const Text(': 8-10'),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  MaterialButton(
                    onPressed: () {},
                    elevation: 8,
                    minWidth: 220,
                    height: 40,
                    color: AppThemes.primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Text(
                      'Reservar',
                      style: TextStyle(
                          color: AppThemes.secundaryColor,
                          fontSize: 17,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  )
                ],
              ),
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            CouplesCabinWidget(),
            SizedBox(
              height: size.height * 0.04,
            ),
            CabinsWidget(
              familyCabinImages: controller.familyCabinImages,
              title: 'Cabaña familiar',
              price: '\$490.000',
              cabinServices: controller.familyCabinServices,
              numberOfBeds: '6',
              maximumOccupancy: '10',
            ),
          ],
        ),
      ),
    );
  }
}
