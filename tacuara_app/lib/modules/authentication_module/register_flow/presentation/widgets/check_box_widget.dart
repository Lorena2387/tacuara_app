import 'package:flutter/material.dart';
import 'package:tacuara_app/utils/app_themes.dart';

class CheckBoxWidget extends StatefulWidget {
  final String textButton;
  final bool checkBoxValue;
  final Function checkBoxOnChanged;
  final Function textButtonOnPressed;
  const CheckBoxWidget({
    super.key,
    required this.textButton,
    required this.checkBoxValue,
    required this.checkBoxOnChanged,
    required this.textButtonOnPressed,
  });

  @override
  State<CheckBoxWidget> createState() => _CheckBoxWidgetState();
}

class _CheckBoxWidgetState extends State<CheckBoxWidget> {
  bool isChecked = false;
  bool isChecked1 = false;
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
            onPressed: () {},
            style:
                TextButton.styleFrom(foregroundColor: AppThemes.primaryColor),
            child: const Text('Acepto los términos y condiciones'),
          ),
        ],
      ),
    );
  }
}
