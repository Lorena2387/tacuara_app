import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tacuara_app/modules/authentication_module/change_password_flow/presentation/widgets/text_form_field_change_pass_widget.dart';
import 'package:tacuara_app/modules/authentication_module/change_password_flow/provider/change_password_provider.dart';
import 'package:tacuara_app/modules/authentication_module/user_profile_flow/presentation/views/tab_bar_user_view.dart';
import 'package:tacuara_app/modules/dashboard_admin_module/home_flow/presentation/views/tab_bar_admin_view.dart';
import 'package:tacuara_app/utils/app_themes.dart';
import 'package:tacuara_app/utils/images.dart';
import 'package:tacuara_app/widgets/my_button2_widget.dart';
import 'package:tacuara_app/widgets/my_button_widget.dart';

class ChangePasswordView extends StatefulWidget {
  const ChangePasswordView({super.key});

  @override
  State<ChangePasswordView> createState() => _ChangePasswordViewState();
}

class _ChangePasswordViewState extends State<ChangePasswordView> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var controller =
        Provider.of<ChangePasswordProvider>(context, listen: false);
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
                      height: size.height * 0.03,
                    ),
                    const Text(
                      'Cambiar contraseña',
                      style: TextStyle(
                        color: Colors.black87,
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                    const Image(
                      image: AssetImage(
                        Images.cambiarcontrasena,
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                    TextFormFieldChangePassWidget(
                      controller: controller.oldPassController,
                      labelText: 'Antigua contraseña',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor ingrese su contraseña';
                        }
                        if (value.length < 6) {
                          return 'Su contraseña debe tener 6 caracteres';
                        }
                        return null;
                      },
                      obscureText: true,
                    ),
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                    TextFormFieldChangePassWidget(
                      controller: controller.newPassController,
                      labelText: 'Nueva contraseña',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor ingrese su contraseña';
                        }
                        if (value.length < 6) {
                          return 'Su contraseña debe tener 6 caracteres';
                        }
                        return null;
                      },
                      obscureText: true,
                    ),
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                    TextFormFieldChangePassWidget(
                      controller: controller.confirmPassController,
                      labelText: 'Confirmar contraseña',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Confirme su contraseña';
                        }
                        if (value != controller.newPassController) {
                          return 'Las contraseñas no coinciden';
                        }
                        return null;
                      },
                      obscureText: true,
                    ),
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                    MyButtonWidget(
                      onPressed: () {},
                      color: AppThemes.primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      text: 'Cambiar',
                      width: 220,
                      height: 40,
                    ),
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                    MyButton2(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const tabBarUserView()));
                      },
                      color: AppThemes.secundaryColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side:
                              const BorderSide(color: AppThemes.primaryColor)),
                      width: 220,
                      height: 40,
                      text: 'Cancelar',
                      onLongPress: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const tabBarAdminView()));
                      },
                    ),
                  ],
                )),
          ),
        ),
      ),
    );
  }
}
