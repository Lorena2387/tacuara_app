import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tacuara_app/modules/authentication_module/register_flow/domain/models/user.dart';
//import 'package:tacuara_app/modules/authentication_module/register_flow/domain/models/firebase_authentication_exception.dart';
import 'package:tacuara_app/modules/authentication_module/register_flow/presentation/widgets/check_box_widget.dart';
import 'package:tacuara_app/modules/authentication_module/register_flow/provider/register_provider.dart';
import 'package:tacuara_app/modules/dashboard_admin_module/home_flow/presentation/views/register_admin_view.dart';
import 'package:tacuara_app/modules/dashboard_module/home_flow/presentation/views/dashboard_view.dart';
//import 'package:tacuara_app/modules/dashboard_module/home_flow/presentation/views/dashboard_view.dart';
import 'package:tacuara_app/modules/privacy_policy_module/privacy_policy_flow/presentation/views/privacy_policy_view.dart';
import 'package:tacuara_app/widgets/my_button2_widget.dart';
import 'package:tacuara_app/widgets/my_button_widget.dart';

import '../../../../../utils/app_themes.dart';
import '../../../../../widgets/text_form_field_widget.dart';
import '../../../login_flow/presentation/views/login_view.dart';
import '../widgets/check_box1_widget.dart';

class UserRegister extends StatefulWidget {
  const UserRegister({
    super.key,
  });

  @override
  State<UserRegister> createState() => _UserRegisterState();
}

class _UserRegisterState extends State<UserRegister> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var controller = Provider.of<RegisterProvider>(context, listen: true);

    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
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
                key: _formKey,
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
                      labelText: 'Nombres',
                      onChange: (value) {
                        controller.name = value;
                      },
                    ),
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
                      labelText: 'Apellidos',
                      onChange: (value) {
                        controller.lastname = value;
                      },
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    TextFormFieldWidget(
                      controller: controller.controllerCellphone,
                      validator: (value) {
                        final phoneRegex = RegExp(r'^[0-9]{10}$');
                        if (!phoneRegex.hasMatch(value!)) {
                          return 'Por favor ingrese un número de celular válido';
                        }
                        return null;
                      },
                      labelText: 'Celular',
                      onChange: (value) {
                        controller.cellphone = value;
                      },
                    ),
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
                      labelText: 'Correo electerónico',
                      onChange: (value) {
                        controller.email = value;
                      },
                    ),
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
                      obscureText: false,
                      onChange: (value) {
                        controller.password = value;
                      },
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    TextFormFieldWidget(
                      controller: controller.controllerConfirmPassword,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Confirme su contraseña';
                        }
                        if (value != controller.password) {
                          return 'Las contraseñas no coinciden';
                        }
                        return null;
                      },
                      labelText: 'Confirmar contraseña',
                      obscureText: false,
                      onChange: (value) {
                        controller.confirmPassword = value;
                      },
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    CheckBox1Widget(
                      textButton: 'Acepto los términos y condiciones',
                      checkBoxValue: controller.termsAndConditionsCheckBoxValue,
                      checkBoxOnChanged: (value) {
                        setState(() => controller
                            .termsAndConditionsCheckBoxValue = value!);
                      },
                      textButtonOnPressed: () {},
                    ),
                    CheckBox2Widget(
                      textButton: 'Acepto la política de privacidad',
                      checkBoxValue: controller.privacyPolicyCheckBoxValue,
                      checkBoxOnChanged: (value) {
                        setState(() =>
                            controller.privacyPolicyCheckBoxValue = value!);
                      },
                      textButtonOnPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const PrivacyPolicyView()));
                      },
                    ),
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                    MyButtonWidget(
                      onPressed: () async {
                        FocusScope.of(context).unfocus();
                        if (validateForm()) {
                          if (validateCheckBox()) {
                            await controller
                                .registerUser(
                              email: controller.controllerEmail.text.trim(),
                              password:
                                  controller.controllerPassword.text.trim(),
                            )
                                .then(
                              (value) async {
                                await controller
                                    .saveUid(uid: value.user!.uid)
                                    .then((_) async {
                                  await controller.getUid();
                                  await controller.saveUserData(
                                      user: UserModel(
                                        name: controller.controllerName.text
                                            .trim(),
                                        lastname: controller
                                            .controllerLastname.text
                                            .trim(),
                                        cellphone: controller
                                            .controllerCellphone.text
                                            .trim(),
                                        email: controller.controllerEmail.text
                                            .trim(),
                                      ),
                                      userUid: controller.userUid);
                                }).then((_) {
                                  showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                      title: Text(
                                        value.user!.uid,
                                      ),
                                      content: const Text(
                                        'El registro ha sido exitoso.',
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
                                });
                              },
                            ).catchError(
                              (error) {
                                showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    title: const Text('Registro de usuario'),
                                    content: Text(
                                      controller.registerUserExceptionMessage(
                                          exceptionCode: error),
                                    ),
                                    actions: [
                                      TextButton(
                                        onPressed: () => Navigator.pop(context),
                                        child: const Text('Cerrar'),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            );
                          } else {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: const Text('Registro'),
                                content: const Text(
                                  'Por favor acepte las políticas de privacidad y los términos y condiciones',
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () => Navigator.pop(context),
                                    child: const Text(
                                      'Cerrar',
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }
                        }
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
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const DashboardView(),
                              ),
                              (route) => false,
                            );
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
      ),
    );
  }

  bool validateForm() {
    return _formKey.currentState!.validate();
  }

  bool validateCheckBox() {
    var controller = Provider.of<RegisterProvider>(context, listen: false);
    return controller.termsAndConditionsCheckBoxValue &&
        controller.privacyPolicyCheckBoxValue;
  }
}
