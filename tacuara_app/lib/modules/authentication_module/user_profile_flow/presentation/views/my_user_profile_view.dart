import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tacuara_app/modules/authentication_module/user_profile_flow/presentation/widgets/text_form_field_profile_widget.dart';
import 'package:tacuara_app/modules/authentication_module/user_profile_flow/provider/profile_provider.dart';

class MyUserProfileView extends StatefulWidget {
  const MyUserProfileView({super.key});

  @override
  State<MyUserProfileView> createState() => _MyUserProfileViewState();
}

class _MyUserProfileViewState extends State<MyUserProfileView> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var controller = Provider.of<ProfileProvider>(context, listen: false);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Form(
            key: _formKey,
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
