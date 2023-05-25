import 'package:flutter/material.dart';
import 'package:tacuara_app/modules/dashboard_module/views/login_view.dart';
import 'package:tacuara_app/modules/dashboard_module/widgets/my_button2_widget.dart';
import 'package:tacuara_app/modules/dashboard_module/widgets/my_button_widget.dart';
import 'package:tacuara_app/modules/dashboard_module/widgets/text_form_field_widget.dart';
import 'package:tacuara_app/utils/app_themes.dart';

class UserRegister extends StatefulWidget {
  const UserRegister({super.key});

  @override
  State<UserRegister> createState() => _UserRegisterState();
}

class _UserRegisterState extends State<UserRegister> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _controllerName = TextEditingController();
  final TextEditingController _controllerLastname = TextEditingController();
  final TextEditingController _controllerCellphone = TextEditingController();
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();
  final TextEditingController _controllerConfirmpassword =
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
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  textFormFieldWidget(
                      controller: _controllerLastname, labelText: 'Apellidos'),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  textFormFieldWidget(
                      controller: _controllerCellphone, labelText: 'Celular'),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  textFormFieldWidget(
                      controller: _controllerEmail,
                      labelText: 'Correo electerónico'),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  textFormFieldWidget(
                    controller: _controllerPassword,
                    labelText: 'Contraseña',
                    obscureText: true,
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  textFormFieldWidget(
                    controller: _controllerConfirmpassword,
                    labelText: 'Confirmar contraseña',
                    obscureText: true,
                  ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 10),
                    child: MyButtonWidget(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginView()));
                      },
                      color: AppThemes.primaryColor,
                      width: 220,
                      height: 40,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      text: 'Registrarme',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8.0,
                      vertical: 10,
                    ),
                    child: MyButton2(
                        onPressed: () {},
                        color: AppThemes.secundaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: const BorderSide(
                            color: AppThemes.primaryColor,
                          ),
                        ),
                        width: 220,
                        height: 40,
                        text: 'Cancelar'),
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Ya tienes cuenta?',
                          style: TextStyle(
                            color: Colors.black38,
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                          )),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const LoginView()));
                        },
                        child: const Text(
                          'Inicia sesión',
                          style: TextStyle(
                              color: AppThemes.primaryColor,
                              fontSize: 13,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
