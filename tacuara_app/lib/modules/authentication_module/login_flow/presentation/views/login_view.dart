import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tacuara_app/modules/authentication_module/login_flow/presentation/widgets/text_form_field_widget.dart';
import 'package:tacuara_app/modules/authentication_module/login_flow/provider/login_provider.dart';
import 'package:tacuara_app/utils/images.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var controller = Provider.of<LoginProvider>(context, listen: false);
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Form(
              key: controller.formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Inicia sesión',
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  const Image(
                    image: AssetImage(Images.iniciosesion),
                  ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  TextFormFielLogindWidget(
                      controller: controller.controllerEmail,
                      labelText: 'Correo electrónico',
                      obscureText: false),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  TextFormFielLogindWidget(
                      controller: controller.controllerPassword,
                      labelText: 'Contraseña',
                      obscureText: true),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
