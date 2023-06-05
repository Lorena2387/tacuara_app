import 'package:flutter/material.dart';

import '../../../../../utils/app_themes.dart';

class TextFormFieldRecoverWidget extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final Function validator;
  const TextFormFieldRecoverWidget(
      {super.key,
      required this.controller,
      required this.labelText,
      required this.validator});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
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
    );
  }
}
