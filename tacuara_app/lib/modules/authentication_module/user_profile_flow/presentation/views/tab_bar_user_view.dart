import 'package:flutter/material.dart';
import 'package:tacuara_app/modules/authentication_module/user_profile_flow/presentation/views/my_reservations_view.dart';
import 'package:tacuara_app/modules/authentication_module/user_profile_flow/presentation/views/my_settings_view.dart';
import 'package:tacuara_app/modules/authentication_module/user_profile_flow/presentation/views/my_user_profile_view.dart';
import 'package:tacuara_app/utils/app_themes.dart';

class tabBarUserView extends StatefulWidget {
  const tabBarUserView({super.key});

  @override
  State<tabBarUserView> createState() => _tabBarUserViewState();
}

class _tabBarUserViewState extends State<tabBarUserView>
    with SingleTickerProviderStateMixin {
  int selectedPage = 0;
  TabController? controller;

  @override
  void initState() {
    super.initState();
    controller =
        TabController(length: 3, initialIndex: selectedPage, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    controller!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppThemes.primaryColor,
      ),
      body: Column(
        children: [
          TabBar(
            controller: controller,
            indicatorColor: AppThemes.primaryColor,
            labelColor: AppThemes.primaryColor,
            unselectedLabelColor: Colors.grey,
            tabs: const [
              Tab(
                child: Text(
                  'Perfil',
                ),
              ),
              Tab(
                child: Text(
                  'Reservas',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 19,
                  ),
                ),
              ),
              Tab(
                child: Text(
                  'Ajustes',
                ),
              ),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: controller,
              children: const [
                MyUserProfileView(),
                MyReservationView(),
                MySettingsView(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
