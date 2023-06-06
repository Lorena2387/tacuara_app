import 'package:flutter/material.dart';
import 'package:tacuara_app/modules/authentication_module/change_password_flow/presentation/views/change_password_view.dart';
import 'package:tacuara_app/modules/privacy_policy_module/privacy_policy_flow/presentation/views/privacy_policy_view.dart';
import 'package:tacuara_app/modules/privacy_policy_module/privacy_policy_flow/presentation/views/terms_conditions_view.dart';
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
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ChangePasswordView()));
              },
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
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const TermsConditionsView()));
              },
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
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const PrivacyPolicyView()));
              },
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
