import 'package:flutter/material.dart';
import 'package:tacuara_app/utils/app_themes.dart';

class CheckBoxWidget extends StatefulWidget {
  const CheckBoxWidget({super.key});

  @override
  State<CheckBoxWidget> createState() => _CheckBoxWidgetState();
}

class _CheckBoxWidgetState extends State<CheckBoxWidget> {
  bool isChecked = false;
  bool isChecked1 = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 10,
          ),
          child: Row(
            children: [
              Checkbox(
                value: isChecked,
                onChanged: (value) {
                  setState(() => isChecked = value!);
                },
                activeColor: AppThemes.primaryColor,
                checkColor: AppThemes.secundaryColor,
              ),
              TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(primary: AppThemes.primaryColor),
                child: const Text('Acepto los términos y condiciones'),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 10,
          ),
          child: Row(
            children: [
              Checkbox(
                value: isChecked1,
                onChanged: (value) {
                  setState(() => isChecked1 = value!);
                },
                activeColor: AppThemes.primaryColor,
                checkColor: AppThemes.secundaryColor,
              ),
              TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(primary: AppThemes.primaryColor),
                child: const Text('Acepto la política de privacidad'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
