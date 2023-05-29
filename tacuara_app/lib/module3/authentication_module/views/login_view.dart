import 'package:flutter/material.dart';
import 'package:tacuara_app/modules/authentication_module/register_flow/presentation/views/user_register_view.dart';
import 'package:tacuara_app/widgets/my_button_widget.dart';
//import 'package:tacuara_app/module3/authentication_module/widgets/text_form_field_widget.dart';
import 'package:tacuara_app/utils/app_themes.dart';
import 'package:tacuara_app/utils/images.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _formKey = GlobalKey<FormState>();
  // final TextEditingController _controllerEmail = TextEditingController();
  // final TextEditingController _controllerPassword = TextEditingController();
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
                  // textFormFieldWidget(
                  //     labelText: 'Correo electrónico',
                  //     controller: _controllerEmail, validator: null,),
                  // SizedBox(
                  //   height: size.height * 0.03,
                  // ),
                  // textFormFieldWidget(
                  //   labelText: 'Contraseña',
                  //   controller: _controllerPassword,
                  //   obscureText: true, validator: null,
                  // ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  MyButtonWidget(
                      onPressed: () {},
                      color: AppThemes.primaryColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      text: 'Iniciar sesión',
                      width: 220,
                      height: 40),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Aun no tienes cuenta?',
                        style: TextStyle(
                          color: Colors.black45,
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const UserRegister()));
                        },
                        child: const Text(
                          'Regístrate',
                          style: TextStyle(
                            color: AppThemes.primaryColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Olvidé mi contraseña',
                        style: TextStyle(
                          color: AppThemes.primaryColor,
                        ),
                      )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
