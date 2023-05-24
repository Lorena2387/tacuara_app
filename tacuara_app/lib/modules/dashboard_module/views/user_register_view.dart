import 'package:flutter/material.dart';
import 'package:tacuara_app/modules/dashboard_module/widgets/text_form_field_widget.dart';

class UserRegister extends StatefulWidget {
  const UserRegister({super.key});

  @override
  State<UserRegister> createState() => _UserRegisterState();
}

class _UserRegisterState extends State<UserRegister> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _controllerName = TextEditingController();
  final TextEditingController _controllerLastname = TextEditingController();
  final TextEditingController _controllerCell_phone = TextEditingController();
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();
  final TextEditingController _controllerConfirm_password =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: size.height * 0.05,
                  ),
                  Text(
                    'Regístrate',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  textFormFieldWidget(
                      controller: _controllerName, labelText: 'Nombres'),
                  textFormFieldWidget(
                      controller: _controllerLastname, labelText: 'Apellidos'),
                  textFormFieldWidget(
                      controller: _controllerCell_phone, labelText: 'Celular'),
                  textFormFieldWidget(
                      controller: _controllerEmail,
                      labelText: 'Correo electerónico'),
                  textFormFieldWidget(
                    controller: _controllerPassword,
                    labelText: 'Contraseña',
                    obscureText: true,
                  ),
                  textFormFieldWidget(
                      controller: _controllerConfirm_password,
                      labelText: 'Confirmar contraseña'),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
