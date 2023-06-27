import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../room_provider.dart';
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
            ),
            CabinsWidget(
              cabinImages: controller.couplesCabinImages,
              title: 'Cabaña parejas',
              price: '\$190.000',
              cabinServices: controller.couplesCabinServices,
              numberOfBeds: '1',
              maximumOccupancy: '2',
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
