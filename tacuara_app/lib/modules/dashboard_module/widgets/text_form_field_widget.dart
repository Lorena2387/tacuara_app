import 'package:flutter/material.dart';
import 'package:tacuara_app/utils/app_themes.dart';

class textFormFieldWidget extends StatelessWidget {
  final String labelText;
  final TextEditingController controller;
  final bool obscureText;

  const textFormFieldWidget({
    super.key,
    required this.labelText,
    required this.controller,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 18,
        vertical: 12,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextFormField(
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
      ),
    );
  }
}
