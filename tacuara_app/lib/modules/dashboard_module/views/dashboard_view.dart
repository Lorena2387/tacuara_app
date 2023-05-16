import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:tacuara_app/utils/app_themes.dart';
import 'package:tacuara_app/utils/images.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  List images = [
    Images.tacuara,
    Images.tacuara1,
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
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.menu),
          ),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.only(bottom: size.height * 0.05),
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
                  Align(
                    alignment: AlignmentDirectional.bottomCenter,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: size.width * 0.04,
                        vertical: size.height * 0.01,
                      ),
                      width: size.width * 0.95,
                      height: size.height * 0.15,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.4),
                            blurRadius: 10,
                            spreadRadius: 0,
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                            children: [
                              const Icon(
                                Icons.location_on_rounded,
                                size: 25,
                                color: AppThemes.primaryColor,
                              ),
                              SizedBox(
                                width: size.width * 0.02,
                              ),
                              const Expanded(
                                child: Text(
                                  'Finca Diosa, vereda San Gerardo\nGarzón-Huila',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.email_outlined,
                                size: 22,
                                color: AppThemes.primaryColor,
                              ),
                              SizedBox(
                                width: size.width * 0.02,
                              ),
                              const Expanded(
                                child: Text(
                                  'ecohoteltacuara@gmail.com',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.phone_android,
                                size: 22,
                                color: AppThemes.primaryColor,
                              ),
                              SizedBox(
                                width: size.width * 0.02,
                              ),
                              const Expanded(
                                child: Text(
                                  '324 3298996',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.05,
              vertical: size.height * 0.025,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Conoce nuestras habitaciones',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: size.height * 0.03,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Card(
                          elevation: 6,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: GestureDetector(
                              onTap: () {
                                // Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //         builder: (context) =>
                                //             const CabanaFamiliar()));
                              },
                              child: Image(
                                width: size.width * 0.35,
                                height: size.width * 0.2,
                                image: const AssetImage(
                                  Images.cabanaFamiliar,
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          'Cabaña familiar',
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w500,
                            fontSize: 13,
                          ),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Card(
                          elevation: 6,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: GestureDetector(
                              onTap: () {
                                // Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //         builder: (context) =>
                                //             const CabanaParejas()));
                              },
                              child: Image(
                                width: size.width * 0.35,
                                height: size.width * 0.2,
                                image: const AssetImage(Images.cabanaParejas3),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          'Cabana parejas',
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w500,
                            fontSize: 13,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.05,
              vertical: size.height * 0.025,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Visita nuestro restaurante',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (_) => Container(
                            width: size.width,
                            height: size.height * 0.5,
                            child: Column(
                              children: [
                                SizedBox(
                                  height: size.height * 0.05,
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      SizedBox(
                                        width: size.width * 0.1,
                                      ),
                                      const Text(
                                        'Visita nuestro restaurante',
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.pop(context);
                                        },
                                        child: Container(
                                          width: size.width * 0.1,
                                          color: Colors.transparent,
                                          child: const Icon(
                                            Icons.close,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: size.height * 0.45,
                                  child: ListView(),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      child: const Text(
                        'Ver más',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          color: AppThemes.primaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: size.height * 0.03,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    Images.tacuara,
                    width: size.width,
                    height: size.height * 0.15,
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.05,
              vertical: size.height * 0.025,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Disfruta un Pasadia',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      'Ver más',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        color: AppThemes.primaryColor,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: size.height * 0.03,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    Images.tacuara,
                    width: size.width,
                    height: size.height * 0.15,
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.05,
              vertical: size.height * 0.025,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Celebra tu evento con nosotros',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      'Ver más',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        color: AppThemes.primaryColor,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: size.height * 0.03,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    Images.tacuara,
                    width: size.width,
                    height: size.height * 0.15,
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
