import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tacuara_app/modules/dashboard_module/dashboard_provider.dart';
import 'package:tacuara_app/modules/dashboard_module/views/dashboard_view.dart';

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
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Hotel Tacuara',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            primary: const Color(0Xff1b5e20),
            seedColor: Colors.white,
          ),
          useMaterial3: true,
        ),
        home: const DashboardView(),
      ),
    );
  }
}
