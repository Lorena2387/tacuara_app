import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../module3/authentication_module/views/user_register_view.dart';
import '../../../utils/app_themes.dart';

class CabinsWidget extends StatefulWidget {
  final List<String> cabinImages;
  final String title;
  final String price;
  final List<String> cabinServices;
  final String numberOfBeds;
  final String maximumOccupancy;
  const CabinsWidget({
    super.key,
    required this.cabinImages,
    required this.title,
    required this.price,
    required this.cabinServices,
    required this.numberOfBeds,
    required this.maximumOccupancy,
  });

  @override
  State<CabinsWidget> createState() => _CabinsWidgetState();
}

class _CabinsWidgetState extends State<CabinsWidget> {
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
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
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
                  items: widget.cabinImages
                      .map(
                        (image) => AspectRatio(
                          aspectRatio: 16 / 9,
                          child: ClipRRect(
                            child: Image.asset(image, fit: BoxFit.fitWidth),
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
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: Text(
                            widget.price,
                            textAlign: TextAlign.center,
                            style: const TextStyle(fontWeight: FontWeight.w700),
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
          Text(
            widget.title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(
            height: size.height * 0.03,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            const Icon(
              Icons.bed,
              size: 18,
              color: AppThemes.primaryColor,
            ),
            SizedBox(
              width: size.width * 0.03,
            ),
            Text(widget.numberOfBeds),
            SizedBox(
              width: size.width * 0.04,
            ),
            const Text(
              '|',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              width: size.width * 0.03,
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            const Icon(Icons.group, size: 18, color: AppThemes.primaryColor),
            SizedBox(
              width: size.width * 0.03,
            ),
            Text(widget.maximumOccupancy)
          ]),
          SizedBox(
            height: size.height * 0.01,
          ),
          GridView.builder(
              padding: const EdgeInsets.all(22),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: widget.cabinServices.length,
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
                        widget.cabinServices[index],
                        maxLines: 2,
                        style: const TextStyle(
                          fontSize: 12,
                        ),
                      ))
                    ],
                  ),
                );
              }),
          SizedBox(
            height: size.height * 0.02,
          ),
          MaterialButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const UserRegister()));
            },
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
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          SizedBox(
            height: size.height * 0.03,
          )
        ],
      ),
    );
  }
}
