import 'package:flutter/material.dart';
import 'package:tacuara_app/utils/app_themes.dart';

class TextFormFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final Function validator;
  final bool obscureText;
  final Function onChange;

  const TextFormFieldWidget({
    super.key,
    required this.labelText,
    this.obscureText = false,
    required this.controller,
    required this.validator,
    required this.onChange,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      style: const TextStyle(
        color: AppThemes.primaryColor,
      ),
      decoration: InputDecoration(
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black45),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: AppThemes.primaryColor,
          ),
        ),
        labelText: labelText,
        labelStyle: const TextStyle(
          color: Colors.black54,
        ),
      ),
      cursorColor: AppThemes.primaryColor,
      validator: (value) => validator.call(value),
      onChanged: (value) => onChange.call(value),
    );
  }
}