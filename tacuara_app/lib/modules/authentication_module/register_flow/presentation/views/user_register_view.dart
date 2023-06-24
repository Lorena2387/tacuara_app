import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tacuara_app/modules/authentication_module/register_flow/data/datasources/error_type.dart';

import 'package:tacuara_app/modules/authentication_module/register_flow/presentation/widgets/check_box_widget.dart';
import 'package:tacuara_app/modules/authentication_module/register_flow/provider/register_provider.dart';

import 'package:tacuara_app/modules/dashboard_admin_module/home_flow/presentation/views/register_admin_view.dart';
//import 'package:tacuara_app/modules/dashboard_module/home_flow/presentation/views/dashboard_view.dart';
import 'package:tacuara_app/modules/privacy_policy_module/privacy_policy_flow/presentation/views/privacy_policy_view.dart';

import 'package:tacuara_app/widgets/my_button2_widget.dart';
import 'package:tacuara_app/widgets/my_button_widget.dart';
import 'package:tacuara_app/modules/authentication_module/register_flow/presentation/widgets/text_form_field_widget.dart';
import 'package:tacuara_app/utils/app_themes.dart';

import '../../../login_flow/presentation/views/login_view.dart';

import '../../provider/register_use_case_provider.dart';
import '../widgets/check_box1_widget.dart';

class UserRegister extends StatefulWidget {
  const UserRegister({
    super.key,
  });

  @override
  State<UserRegister> createState() => _UserRegisterState();
}

class _UserRegisterState extends State<UserRegister> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var controller = Provider.of<RegisterProvider>(context, listen: false);
    var registerUseCaseProvider =
        Provider.of<RegisterUseCaseProvider>(context, listen: false);

    // Future<void> _registerUser() {
    //   final name = controller.controllerName.text;

    // }
    void registerUser() {
      if (controller.formKey.currentState!.validate()) {
        final name = controller.controllerName.text;
        final lastname = controller.controllerLastname.text;
        final cellphone = controller.controllerCellphone.text;
        final email = controller.controllerEmail.text;
        final password = controller.controllerPassword.text;
        final authErrorType = registerUseCaseProvider.registerUser(
            name, lastname, cellphone, email, password);
        // ignore: unrelated_type_equality_checks
        if (authErrorType == AuthErrorType.success) {
          try {
            if (authErrorType == AuthErrorType.invalidEmail) {
              showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                        title: const Text('Registro'),
                        content: const Text('El email es incorrecto'),
                        actions: [
                          TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: const Text('Ok'))
                        ],
                      ));

              // ignore: unrelated_type_equality_checks
            } else if (authErrorType == AuthErrorType.weakPassword) {
              showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                        title: const Text('Registro'),
                        content: const Text('Contraseña debil'),
                        actions: [
                          TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: const Text('Ok'))
                        ],
                      ));
              // ignore: unrelated_type_equality_checks
            } else if (authErrorType == AuthErrorType.emailAreadyInUse) {
              showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                        title: const Text('Registro'),
                        content: const Text('El email ya está en uso'),
                        actions: [
                          TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: const Text('Ok'))
                        ],
                      ));
            } else {
              throw Exception(AuthErrorType.unexpectedError);
            }
          } catch (e) {
            throw Exception(AuthErrorType.unexpectedError);
          }
        }
      }
    }

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const RegisterAdminView()));
            },
            icon: const Icon(
              Icons.person,
              color: Colors.transparent,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: controller.formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  Text(
                    'Regístrate',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  TextFormFieldWidget(
                      controller: controller.controllerName,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor ingrese su nombre';
                        }
                        return null;
                      },
                      labelText: 'Nombres'),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  TextFormFieldWidget(
                      controller: controller.controllerLastname,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor ingrese su apellido';
                        }
                        return null;
                      },
                      labelText: 'Apellidos'),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  TextFormFieldWidget(
                      controller: controller.controllerCellphone,
                      validator: (value) {
                        final phoneRegex = RegExp(r'^\+?[1-9]\d{1,14}$');
                        if (!phoneRegex.hasMatch(value!)) {
                          return 'Por favor ingrese un número de celular válido';
                        }
                        return null;
                      },
                      labelText: 'Celular'),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  TextFormFieldWidget(
                      controller: controller.controllerEmail,
                      validator: (value) {
                        final emailRegExp =
                            RegExp(r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+');
                        if (value == null || value.isEmpty) {
                          return 'Por favor ingrese su correo electrónico';
                        }
                        if (!emailRegExp.hasMatch(value)) {
                          return 'Por favor ingre un correo válido';
                        }
                        return null;
                      },
                      labelText: 'Correo electerónico'),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  TextFormFieldWidget(
                    controller: controller.controllerPassword,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor ingrese su contraseña';
                      }
                      if (value.length < 6) {
                        return 'Su contraseña debe tener 6 caracteres';
                      }
                      return null;
                    },
                    labelText: 'Contraseña',
                    obscureText: true,
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  // TextFormFieldWidget(
                  //   controller: controller.controllerConfirmPassword,
                  //   validator: (value) {
                  //     if (value == null || value.isEmpty) {
                  //       return 'Confirme su contraseña';
                  //     }
                  //     if (value != controller.controllerPassword) {
                  //       return 'Las contraseñas no coinciden';
                  //     }
                  //     return null;
                  //   },
                  //   labelText: 'Confirmar contraseña',
                  //   obscureText: true,
                  // ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  CheckBox1Widget(
                    textButton: 'Acepto los términos y condiciones',
                    checkBoxValue: controller.termsAndConditionsCheckBoxValue,
                    checkBoxOnChanged: (value) {
                      setState(() =>
                          controller.termsAndConditionsCheckBoxValue = value!);
                    },
                    textButtonOnPressed: () {},
                  ),
                  CheckBox2Widget(
                    textButton: 'Acepto la política de privacidad',
                    checkBoxValue: controller.privacyPolicyCheckBoxValue,
                    checkBoxOnChanged: (value) {
                      setState(
                          () => controller.privacyPolicyCheckBoxValue = value!);
                    },
                    textButtonOnPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const PrivacyPolicyView()));
                    },
                  ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  MyButtonWidget(
                    onPressed: () {
                      controller
                          .registerUser(
                        email: controller.controllerEmail.text.trim(),
                        password: controller.controllerPassword.text.trim(),
                      )
                          .then(
                        (value) {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: const Text(
                                'Registro',
                              ),
                              content: const Text(
                                'El email es incorrecto',
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const LoginView()),
                                  ),
                                  child: const Text(
                                    'Ok',
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ).catchError((error) {});
                    },
                    onLongPress: () {},
                    color: AppThemes.primaryColor,
                    width: 220,
                    height: 40,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    text: 'Registrarme',
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8.0,
                      vertical: 10,
                    ),
                    child: MyButton2(
                        onPressed: () {
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => const DashboardView()));
                        },
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
