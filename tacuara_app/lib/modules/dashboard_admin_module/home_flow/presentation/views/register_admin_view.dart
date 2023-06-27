import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tacuara_app/modules/dashboard_admin_module/home_flow/provider/dashboard_admin_provider.dart';
import 'package:tacuara_app/widgets/text_form_field_widget.dart';

class RegisterAdminView extends StatefulWidget {
  const RegisterAdminView({super.key});

  @override
  State<RegisterAdminView> createState() => _RegisterAdminViewState();
}

class _RegisterAdminViewState extends State<RegisterAdminView> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var controller = Provider.of<DashboardAdminProvider>(context, listen: true);
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
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
                  labelText: 'Nombre',
                  controller: controller.nameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor ingrese se nombre';
                    }
                    return null;
                  },
                  onChange: (value) {
                    controller.name = value;
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
