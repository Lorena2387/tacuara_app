import 'package:flutter/material.dart';
import 'package:tacuara_app/modules/dashboard_admin_module/home_flow/presentation/views/admin_profile_view.dart';
import 'package:tacuara_app/modules/dashboard_admin_module/home_flow/presentation/views/regsiter_user_view.dart';
import 'package:tacuara_app/modules/dashboard_admin_module/home_flow/presentation/views/user_reservations_view.dart';
import 'package:tacuara_app/utils/app_themes.dart';

class tabBarAdminView extends StatefulWidget {
  const tabBarAdminView({super.key});

  @override
  State<tabBarAdminView> createState() => _tabBarAdminViewState();
}

class _tabBarAdminViewState extends State<tabBarAdminView>
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
      endDrawer: Drawer(
          child: ListView(
        children: [
          ListTile(
            title: const Text(
              'Cambiar mi contraseña',
              style: TextStyle(
                color: AppThemes.primaryColor,
                fontWeight: FontWeight.w500,
              ),
            ),
            onTap: () {},
          ),
          const SizedBox(
            height: 10,
          ),
          ListTile(
            title: const Text(
              'Términos y condiciones',
              style: TextStyle(
                color: AppThemes.primaryColor,
                fontWeight: FontWeight.w500,
              ),
            ),
            onTap: () {},
          ),
          const SizedBox(
            height: 10,
          ),
          ListTile(
            title: const Text(
              'Política de privacidad',
              style: TextStyle(
                  color: AppThemes.primaryColor, fontWeight: FontWeight.w500),
            ),
            onTap: () {},
          ),
          const SizedBox(
            height: 300,
          ),
          ListTile(
            title: const Text(
              'Cerrar sesión',
              style: TextStyle(color: Colors.red, fontWeight: FontWeight.w500),
            ),
            onTap: () {},
          )
        ],
      )),
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
                  'Reservacion',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 17,
                  ),
                ),
              ),
              Tab(
                child: Text(
                  'Registros',
                  style: TextStyle(
                    fontSize: 17,
                  ),
                ),
              ),
              Tab(
                child: Text(
                  'Perfil',
                  style: TextStyle(
                    fontSize: 17,
                  ),
                ),
              ),
            ],
          ),
          Expanded(
              child: TabBarView(
            controller: controller,
            children: const [
              UserReservations(),
              RegisterUser(),
              AdminProfileView()
            ],
          ))
        ],
      ),
    );
  }
}
