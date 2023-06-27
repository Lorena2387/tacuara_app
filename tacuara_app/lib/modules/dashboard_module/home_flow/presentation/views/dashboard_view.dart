import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tacuara_app/modules/authentication_module/user_profile_flow/presentation/views/tab_bar_user_view.dart';
import 'package:tacuara_app/modules/dashboard_module/home_flow/provider/dashboard_provider.dart';
//import 'package:tacuara_app/modules/dashboard_module/views/cabana_familiar_view.dart';

import 'package:tacuara_app/modules/dashboard_module/home_flow/presentation/widgets/other_services_card_widget.dart';
import 'package:tacuara_app/modules/privacy_policy_module/privacy_policy_flow/presentation/views/privacy_policy_view.dart';
import 'package:tacuara_app/modules/privacy_policy_module/privacy_policy_flow/presentation/views/terms_conditions_view.dart';
import 'package:tacuara_app/utils/app_themes.dart';
import 'package:tacuara_app/utils/images.dart';

import '../../../../bookings_module/calendar_module/date_picker_view.dart';
import '../widgets/show_day_pass_bottom_sheet_widget.dart';
import '../widgets/show_event_botton_sheet_widget.dart';
import '../widgets/show_restaurant_bottom_sheet_widget.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  @override
  Widget build(BuildContext context) {
    var controller = Provider.of<DashboardProvider>(context, listen: false);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: EdgeInsets.all(size.width * 0.02),
          child: Image.asset(Images.appLogo),
        ),
        title: Text(
          'Hotel Tacuara',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        centerTitle: true,
      ),
      endDrawer: Drawer(
        child: ListView(children: [
          ListTile(
            title: const Text(
              'Perfil',
              style: TextStyle(
                  color: AppThemes.primaryColor, fontWeight: FontWeight.w500),
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const tabBarUserView()));
            },
          ),
          SizedBox(
            height: size.height * 0.01,
          ),
          ListTile(
            title: const Text(
              'Términos y condiciones',
              style: TextStyle(
                  color: AppThemes.primaryColor, fontWeight: FontWeight.w500),
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const TermsConditionsView()));
            },
          ),
          SizedBox(
            height: size.height * 0.01,
          ),
          ListTile(
            title: const Text(
              'Política de privacidad',
              style: TextStyle(
                  color: AppThemes.primaryColor, fontWeight: FontWeight.w500),
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const PrivacyPolicyView()));
            },
          )
        ]),
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
                    items: controller.dashboardImages
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
                                        fontWeight: FontWeight.w700)),
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
                  'Alojamiento Tacuara es el lugar perfecto para compartir, descansar y vivir una experiencia inolvidable en medio de la naturaleza.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                Text('Conoce nuestras habitaciones',
                    style: Theme.of(context).textTheme.titleSmall),
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
                                //             const CabanaFamiliarView()));
                              },
                              child: Image(
                                width: size.width * 0.41,
                                height: size.width * 0.3,
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
                        Text(
                          'Cabaña familiar',
                          style: Theme.of(context).textTheme.titleSmall,
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
                                //  Navigator.push(
                                //      context,
                                //      MaterialPageRoute(
                                //          builder: (context) =>
                                //              const CabanaParejas()));
                              },
                              child: Image(
                                width: size.width * 0.41,
                                height: size.width * 0.3,
                                image: const AssetImage(Images.cabanaParejas3),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text('Cabaña parejas',
                            style: Theme.of(context).textTheme.titleSmall)
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                MaterialButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const DatePickerView()));
                  },
                  elevation: 8,
                  minWidth: 220,
                  height: 40,
                  color: AppThemes.primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Text(
                    'Consultar disponibilidad',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                      color: AppThemes.secundaryColor,
                    ),
                  ),
                )
              ],
            ),
          ),
          OtherServicesCardWidget(
            title: 'Visita nuestro restaurante',
            image: Images.restaurante,
            onTap: () => showRestaurantBottomSheetWidget(context: context),
          ),
          OtherServicesCardWidget(
            title: 'Disfruta de un pasadía',
            image: Images.pasadia,
            onTap: () => showDayPassBottomSheetWidget(context: context),
          ),
          OtherServicesCardWidget(
            title: 'Celebra tu evento con nosotros',
            image: Images.eventos,
            onTap: () => showEventBottonSheetWidget(context: context),
          ),
        ],
      ),
    );
  }
}
