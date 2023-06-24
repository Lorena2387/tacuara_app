import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tacuara_app/modules/dashboard_admin_module/home_flow/presentation/widgets/text_fomr_field_admin_profile_widget.dart';
import 'package:tacuara_app/modules/dashboard_admin_module/home_flow/provider/dashboard_admin_provider.dart';
import 'package:tacuara_app/utils/app_themes.dart';
import 'package:tacuara_app/widgets/my_button_widget.dart';

class AdminProfileView extends StatefulWidget {
  const AdminProfileView({super.key});

  @override
  State<AdminProfileView> createState() => _AdminProfileViewState();
}

class _AdminProfileViewState extends State<AdminProfileView> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var controller =
        Provider.of<DashboardAdminProvider>(context, listen: false);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Center(
            child: Form(
              //key: _formKey,
              child: Column(
                children: [
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  const Text(
                    'Bienvenido!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        color: Colors.black87),
                  ),
                  SizedBox(
                    height: size.height * 0.04,
                  ),
                  TextFormFieldAdminProfileWidget(
                    controller: controller.nameController,
                    labelText: 'Nombre y apellido',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor ingrese su nombre';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  TextFormFieldAdminProfileWidget(
                    controller: controller.postController,
                    labelText: 'Cargo',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor ingrese su cargo';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  TextFormFieldAdminProfileWidget(
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
                    height: size.height * 0.04,
                  ),
                  MyButtonWidget(
                    onPressed: () {},
                    color: AppThemes.primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    text: 'Guardar',
                    width: 220,
                    height: 40,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
