import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

import 'package:tacuara_app/modules/authentication_module/change_password_flow/provider/change_password_provider.dart';
import 'package:tacuara_app/modules/authentication_module/login_flow/provider/login_provider.dart';
import 'package:tacuara_app/modules/authentication_module/recover_password_flow/provider/recover_password_provider.dart';
import 'package:tacuara_app/modules/authentication_module/register_flow/data/datasources/auth_datasource.dart';
import 'package:tacuara_app/modules/authentication_module/register_flow/data/datasources/user_datasource.dart';
import 'package:tacuara_app/modules/authentication_module/register_flow/domain/repositories/auth_repository_domain.dart';
import 'package:tacuara_app/modules/authentication_module/register_flow/domain/use_cases/register_usecase.dart';

// import 'package:tacuara_app/modules/authentication_module/register_flow/data/datasources/auth_datasource.dart';
// import 'package:tacuara_app/modules/authentication_module/register_flow/data/datasources/user_datasource.dart';
// import 'package:tacuara_app/modules/authentication_module/register_flow/domain/repositories/auth_repository_domain.dart';
// import 'package:tacuara_app/modules/authentication_module/register_flow/domain/repositories/user_repository_domain.dart';
// import 'package:tacuara_app/modules/authentication_module/register_flow/domain/use_cases/register_usecase.dart';
//import 'package:tacuara_app/modules/authentication_module/register_flow/domain/use_cases/register_usecase.dart';
import 'package:tacuara_app/modules/authentication_module/register_flow/provider/register_provider.dart';
import 'package:tacuara_app/modules/authentication_module/register_flow/provider/register_use_case_provider.dart';
import 'package:tacuara_app/modules/authentication_module/user_profile_flow/provider/profile_provider.dart';
import 'package:tacuara_app/modules/dashboard_admin_module/home_flow/provider/dashboard_admin_provider.dart';
import 'package:tacuara_app/modules/dashboard_module/home_flow/provider/dashboard_provider.dart';
import 'package:tacuara_app/modules/dashboard_module/home_flow/presentation/views/dashboard_view.dart';
import 'package:tacuara_app/utils/app_themes.dart';

import 'modules/room_types/room_flow/room_provider.dart';

//import 'modules/authentication_module/register_flow/provider/register_use_case_provider.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  GetIt.instance.registerFactory<AuthRepositoryImpl>(
    () => AuthRepositoryImpl(AuthDataSource(), UserDataSource()),
  );
  GetIt.instance.registerFactory<RegisterUseCase>(
    () =>
        RegisterUseCase(AuthRepositoryImpl(AuthDataSource(), UserDataSource())),
  );

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
        ChangeNotifierProvider(
          create: (_) => DashboardAdminProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => RecoverPasswordProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => ChangePasswordProvider(),
        ),
        ChangeNotifierProvider<RegisterUseCaseProvider>(
          create: (_) => RegisterUseCaseProvider(
            RegisterUseCase(
              AuthRepositoryImpl(
                AuthDataSource(),
                UserDataSource(),
              ),
            ),
          ),
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
