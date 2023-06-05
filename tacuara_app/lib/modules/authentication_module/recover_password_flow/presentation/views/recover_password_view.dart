import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tacuara_app/modules/authentication_module/recover_password_flow/presentation/widgets/text_form_filed_recover_widget.dart';
import 'package:tacuara_app/modules/authentication_module/recover_password_flow/provider/recover_password_provider.dart';
import 'package:tacuara_app/utils/app_themes.dart';
import 'package:tacuara_app/utils/images.dart';
import 'package:tacuara_app/widgets/my_button_widget.dart';

class RecoverPasswordView extends StatefulWidget {
  const RecoverPasswordView({super.key});

  @override
  State<RecoverPasswordView> createState() => _RecoverPasswordViewState();
}

class _RecoverPasswordViewState extends State<RecoverPasswordView> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var controller =
        Provider.of<RecoverPasswordProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const Text(
                      'Recuperar contraseña',
                      style: TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.w500,
                          fontSize: 20),
                    ),
                    SizedBox(
                      height: size.height * 0.00,
                    ),
                    const Image(
                      width: 300,
                      height: 300,
                      image: AssetImage(
                        Images.recuperarcontrasena,
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                    TextFormFieldRecoverWidget(
                      controller: controller.emailController,
                      labelText: 'Correo electrónico',
                      validator: (value) {
                        final emailRegExp =
                            RegExp(r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+');
                        if (value == null || value.isEmpty) {
                          return 'Por favor ingrese su correo electrónico';
                        }
                        if (!emailRegExp.hasMatch(value)) {
                          return 'Por favor ingrese un correo válido';
                        }
                        return null;
                      },
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
                      text: 'Recuperar',
                      width: 220,
                      height: 40,
                    ),
                    SizedBox(
                      height: size.height * 0.25,
                    )
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
