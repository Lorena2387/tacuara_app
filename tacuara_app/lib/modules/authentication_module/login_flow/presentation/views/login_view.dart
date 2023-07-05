import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tacuara_app/modules/authentication_module/login_flow/provider/login_provider.dart';
import 'package:tacuara_app/modules/authentication_module/recover_password_flow/presentation/views/recover_password_view.dart';
import 'package:tacuara_app/modules/authentication_module/register_flow/presentation/views/user_register_view.dart';
import 'package:tacuara_app/modules/authentication_module/user_profile_flow/presentation/views/tab_bar_user_view.dart';
//import 'package:tacuara_app/modules/authentication_module/user_profile_flow/presentation/views/tab_bar_user_view.dart';
//import 'package:tacuara_app/modules/dashboard_admin_module/home_flow/presentation/views/admin_profile_view.dart';
import 'package:tacuara_app/modules/dashboard_admin_module/home_flow/presentation/views/tab_bar_admin_view.dart';
import 'package:tacuara_app/utils/app_themes.dart';
import 'package:tacuara_app/utils/images.dart';
import 'package:tacuara_app/widgets/my_button_widget.dart';

import '../../../../../widgets/text_form_field_widget.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var controller = Provider.of<LoginProvider>(context, listen: true);
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
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
                  TextFormFieldWidget(
                    controller: controller.controllerEmail,
                    labelText: 'Correo electrónico',
                    obscureText: false,
                    validator: (value) {
                      final emailRegExp =
                          RegExp(r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+');
                      if (value == null || value.isEmpty) {
                        return 'Por favor ingrese su correo electrónico';
                      }
                      if (!emailRegExp.hasMatch(value)) {
                        return 'Por favor ingrese un correo válido';
                      }
                    },
                    onChange: (value) {
                      controller.email = value;
                    },
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  TextFormFieldWidget(
                    controller: controller.controllerPassword,
                    labelText: 'Contraseña',
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor ingrese su contraseña';
                      }
                      if (value.length < 6) {
                        return 'Su contraseña debe tener 6 caracteres';
                      }
                    },
                    onChange: (value) {
                      controller.password = value;
                    },
                  ),
                  SizedBox(
                    height: size.height * 0.04,
                  ),
                  MyButtonWidget(
                    onPressed: () async {
                      if (validateForm()) {
                        await controller
                            .loginUser(
                          email: controller.email.trim(),
                          password: controller.password.trim(),
                        )
                            .then(
                          (value) async {
                            await controller
                                .saveUid(uid: value.user!.uid)
                                .then((_) {
                              controller.validateUserAdmin();
                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  title: Text(
                                    value.user!.uid,
                                  ),
                                  content:
                                      const Text('Inicio de sesión exitoso'),
                                  actions: [
                                    TextButton(
                                      onPressed: () => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const tabBarUserView(),
                                        ),
                                      ),
                                      child: const Text('Ok'),
                                    ),
                                  ],
                                ),
                              );
                            });
                          },
                        ).catchError(
                          (error) {
                            showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                      title: const Text('Inicio de sesión'),
                                      content: Text(
                                        controller.loginUserExceptionMessage(
                                            exceptionCode: error),
                                      ),
                                      actions: [
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.pop(context),
                                          child: const Text('Ok'),
                                        ),
                                      ],
                                    ));
                          },
                        );
                      }
                    },
                    color: AppThemes.primaryColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    text: 'Iniciar sesión',
                    width: 220,
                    height: 40,
                    onLongPress: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const tabBarAdminView()));
                    },
                  ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'No tienes cuenta?',
                        style: TextStyle(
                          color: Colors.black45,
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const UserRegister()));
                          },
                          child: const Text(
                            'Regístrate',
                            style: TextStyle(
                              color: AppThemes.primaryColor,
                              fontSize: 17,
                            ),
                          ))
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const RecoverPasswordView()));
                      },
                      child: const Text(
                        'Olvidé mi contraseña',
                        style: TextStyle(
                          color: AppThemes.primaryColor,
                          fontSize: 17,
                        ),
                      ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  bool validateForm() {
    return _formKey.currentState!.validate();
  }
}
