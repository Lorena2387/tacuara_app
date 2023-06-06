import 'package:flutter/material.dart';
import 'package:tacuara_app/utils/images.dart';

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
                  ],
                )),
          ),
        ),
      ),
    );
  }
}
