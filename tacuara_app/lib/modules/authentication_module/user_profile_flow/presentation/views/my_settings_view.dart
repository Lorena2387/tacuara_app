import 'package:flutter/material.dart';
import 'package:tacuara_app/utils/app_themes.dart';

class MySettingsView extends StatefulWidget {
  const MySettingsView({super.key});

  @override
  State<MySettingsView> createState() => _MySettingsViewState();
}

class _MySettingsViewState extends State<MySettingsView> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.04,
            ),
            TextButton(
              onPressed: () {},
              child: const Text(
                'Cambiar mi contraseña',
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: AppThemes.primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
            TextButton(
              onPressed: () {},
              child: const Text(
                'Términos y condiciones',
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: AppThemes.primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
            TextButton(
              onPressed: () {},
              child: const Text(
                'Política de privacidad',
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: AppThemes.primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.50,
            ),
            TextButton(
              onPressed: () {},
              child: const Text(
                'Cerrar sesión',
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
