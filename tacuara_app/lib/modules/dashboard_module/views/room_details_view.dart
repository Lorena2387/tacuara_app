import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../utils/images.dart';

class RoomDetailsView extends StatefulWidget {
  const RoomDetailsView({super.key});

  @override
  State<RoomDetailsView> createState() => _RoomDetailsViewState();
}

class _RoomDetailsViewState extends State<RoomDetailsView> {
  List<String> images = [
    Images.cabanafam1,
    Images.cabanafam2,
    Images.cabanafam3,
    Images.cabanafam4,
  ];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.03,
            ),
            SizedBox(
              width: size.width,
              child: Card(
                elevation: 20,
                margin: const EdgeInsets.symmetric(
                  horizontal: 8,
                ),
                child: Column(mainAxisSize: MainAxisSize.min, children: [
                  CarouselSlider(
                      options: CarouselOptions(
                        aspectRatio: 16 / 9,
                        autoPlay: true,
                        autoPlayCurve: Curves.linear,
                        viewportFraction: 1,
                        enlargeStrategy: CenterPageEnlargeStrategy.zoom,
                      ),
                      items: images
                          .map(
                            (image) => AspectRatio(
                              aspectRatio: 16 / 9,
                              child: Image.asset(
                                image,
                                fit: BoxFit.fitWidth,
                              ),
                            ),
                          )
                          .toList()),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
