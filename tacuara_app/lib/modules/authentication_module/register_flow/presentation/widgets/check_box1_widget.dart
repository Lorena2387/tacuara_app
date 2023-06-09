import 'package:flutter/material.dart';
import 'package:tacuara_app/modules/privacy_policy_module/privacy_policy_flow/presentation/views/privacy_policy_view.dart';
import 'package:tacuara_app/utils/app_themes.dart';

class CheckBox2Widget extends StatefulWidget {
  final String textButton;
  final bool checkBoxValue;
  final Function checkBoxOnChanged;
  final Function textButtonOnPressed;
  const CheckBox2Widget(
      {super.key,
      required this.textButton,
      required this.checkBoxValue,
      required this.checkBoxOnChanged,
      required this.textButtonOnPressed});

  @override
  State<CheckBox2Widget> createState() => _CheckBox2WidgetState();
}

class _CheckBox2WidgetState extends State<CheckBox2Widget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 10,
      ),
      child: Row(
        children: [
          Checkbox(
            value: widget.checkBoxValue,
            onChanged: (value) => widget.checkBoxOnChanged.call(value),
            activeColor: AppThemes.primaryColor,
            checkColor: AppThemes.secundaryColor,
          ),
          TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const PrivacyPolicyView()));
              },
              style:
                  TextButton.styleFrom(foregroundColor: AppThemes.primaryColor),
              child: const Text('Acepto la política de privacidad'))
        ],
      ),
    );
  }
}
