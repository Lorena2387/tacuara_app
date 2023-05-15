import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:tacuara_app/utils/images.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  List images = [
    Images.cabana1,
    Images.cabana2,
    Images.cabana3,
  ];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: EdgeInsets.all(size.width * 0.02),
          child: Image.asset(Images.appLogo),
        ),
        title: const Text('Hotel Tacuara'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.menu),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(0),
        children: [
          Container(
            color: Colors.red,
            child: CarouselSlider(
              items: images
                  .map((image) => SizedBox(
                        child: Image.asset(
                          image,
                          fit: BoxFit.fitWidth,
                        ),
                      ))
                  .toList(),
              options: CarouselOptions(
                height: 300,
                autoPlay: true,
                autoPlayCurve: Curves.linear,
                viewportFraction: 1.0,
                enlargeStrategy: CenterPageEnlargeStrategy.zoom,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
