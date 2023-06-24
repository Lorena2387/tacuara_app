import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tacuara_app/modules/authentication_module/user_profile_flow/presentation/widgets/text_form_field_profile_widget.dart';
import 'package:tacuara_app/modules/authentication_module/user_profile_flow/provider/profile_provider.dart';
import 'package:tacuara_app/utils/app_themes.dart';
import 'package:tacuara_app/widgets/my_button_widget.dart';

class MyUserProfileView extends StatefulWidget {
  const MyUserProfileView({super.key});

  @override
  State<MyUserProfileView> createState() => _MyUserProfileViewState();
}

class _MyUserProfileViewState extends State<MyUserProfileView> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var controller = Provider.of<ProfileProvider>(context, listen: false);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Form(
            //key: _formKey,
            child: Column(
              children: [
                SizedBox(
                  height: size.height * 0.05,
                ),
                TextFormFieldProfileWidget(
                  controller: controller.nameController,
                  labelText: 'Nombre',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor ingerse su nombre';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: size.height * 0.03,
                ),
                TextFormFieldProfileWidget(
                  controller: controller.lastnameController,
                  labelText: 'Apellido',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor ingrese su apellido';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: size.height * 0.03,
                ),
                TextFormFieldProfileWidget(
                  controller: controller.cellphoneController,
                  labelText: 'Celular',
                  validator: (value) {
                    final phoneRegex = RegExp(r'^\+?[1-9]\d{1,14}$');
                    if (!phoneRegex.hasMatch(value!)) {
                      return 'Por favor ingrese un número de celular válido';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: size.height * 0.03,
                ),
                TextFormFieldProfileWidget(
                  controller: controller.addressController,
                  labelText: 'Dirección',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor ingrese su dirección';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: size.height * 0.03,
                ),
                TextFormFieldProfileWidget(
                  controller: controller.identificationNumberController,
                  labelText: 'Número de identificación',
                  validator: (value) {
                    final validNumberRegex = RegExp(r'^\d{8,10}$');
                    if (!validNumberRegex.hasMatch(value)) {
                      return 'El número de identificación debe tener entre 8 y 10 dígitos';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: size.height * 0.03,
                ),
                TextFormFieldProfileWidget(
                  controller: controller.birthdateController,
                  labelText: 'Fecha de nacimiento',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor ingrese su fecha de nacimiento';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: size.height * 0.03,
                ),
                TextFormFieldProfileWidget(
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
                      borderRadius: BorderRadius.circular(10)),
                  text: 'Guardar',
                  width: 220,
                  height: 40,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
