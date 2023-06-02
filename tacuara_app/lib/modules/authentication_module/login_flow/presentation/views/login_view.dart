import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tacuara_app/modules/authentication_module/login_flow/presentation/widgets/text_form_field_widget.dart';
import 'package:tacuara_app/modules/authentication_module/login_flow/provider/login_provider.dart';
import 'package:tacuara_app/modules/authentication_module/register_flow/presentation/views/user_register_view.dart';
import 'package:tacuara_app/modules/authentication_module/user_profile_flow/presentation/views/tab_bar_user_view.dart';
import 'package:tacuara_app/modules/dashboard_admin_module/home_flow/presentation/views/admin_profile_view.dart';
import 'package:tacuara_app/utils/app_themes.dart';
import 'package:tacuara_app/utils/images.dart';
import 'package:tacuara_app/widgets/my_button_widget.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _formKey = GlobalKey();
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
                  SizedBox(
                    height: size.height * 0.04,
                  ),
                  MyButtonWidget(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const tabBarUserView()));
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
                              builder: (context) => const AdminProfile()));
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
                      onPressed: () {},
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
}
