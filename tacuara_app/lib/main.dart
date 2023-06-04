import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tacuara_app/module2/room_module/room_provider.dart';
import 'package:tacuara_app/modules/authentication_module/login_flow/provider/login_provider.dart';
import 'package:tacuara_app/modules/authentication_module/register_flow/provider/register_provider.dart';
import 'package:tacuara_app/modules/authentication_module/user_profile_flow/provider/profile_provider.dart';
import 'package:tacuara_app/modules/dashboard_module/home_flow/provider/dashboard_provider.dart';
import 'package:tacuara_app/modules/dashboard_module/home_flow/presentation/views/dashboard_view.dart';
import 'package:tacuara_app/utils/app_themes.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => DashboardProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => RoomProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => RegisterProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => LoginProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => ProfileProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Hotel Tacuara',
        theme: AppThemes.light,
        home: const DashboardView(),
      ),
    );
  }
}
