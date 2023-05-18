import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../../../utils/images.dart';

class CabanaFamiliarView extends StatefulWidget {
  const CabanaFamiliarView({super.key});

  @override
  State<CabanaFamiliarView> createState() => _CabanaFamiliarViewState();
}

class _CabanaFamiliarViewState extends State<CabanaFamiliarView> {
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
      body: ListView(
        padding: EdgeInsets.only(
          bottom: size.height * 0.05,
        ),
        physics: const RangeMaintainingScrollPhysics(),
        children: [
          SizedBox(
            width: size.width,
            child: AspectRatio(
              aspectRatio: 16 / 13,
              child: Stack(
                alignment: AlignmentDirectional.topCenter,
                children: [
                  CarouselSlider(
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
                        .toList(),
                    options: CarouselOptions(
                      autoPlay: true,
                      autoPlayCurve: Curves.linear,
                      viewportFraction: 1.0,
                      enlargeStrategy: CenterPageEnlargeStrategy.zoom,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Text(
            'Cabaña familiar',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(
            height: size.height * 0.01,
          ),
          const Text(
            'La noche en la cabaña familiar incluye:',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          )
        ],
      ),
    );
  }
}
