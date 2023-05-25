import 'package:flutter/material.dart';
import 'package:tacuara_app/modules/dashboard_module/widgets/text_form_field_widget.dart';
import 'package:tacuara_app/utils/images.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Text(
                    'Inicia sesión',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  const Image(
                    image: AssetImage(Images.iniciosesion),
                  ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  textFormFieldWidget(
                      labelText: 'Correo electrónico',
                      controller: _controllerEmail),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  textFormFieldWidget(
                    labelText: 'Contraseña',
                    controller: _controllerPassword,
                    obscureText: true,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
