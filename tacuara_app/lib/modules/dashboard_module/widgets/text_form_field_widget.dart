import 'package:flutter/material.dart';

class textFormFieldWidget extends StatelessWidget {
  final String initialText;
  final TextStyle textStyle;

  const textFormFieldWidget(
      {super.key, required this.initialText, required this.textStyle});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        style: textStyle,
        decoration: InputDecoration(
          hintText: initialText,
        ),
      ),
    );
  }
}
