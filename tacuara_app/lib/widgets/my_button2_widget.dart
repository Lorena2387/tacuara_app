import 'package:flutter/material.dart';
import 'package:tacuara_app/utils/app_themes.dart';

class MyButton2 extends StatelessWidget {
  final VoidCallback onPressed;
  final Color color;
  final ShapeBorder shape;
  final double width;
  final double height;
  final String text;
  const MyButton2(
      {super.key,
      required this.onPressed,
      required this.color,
      required this.shape,
      required this.width,
      required this.height,
      required this.text});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: color,
      shape: shape,
      minWidth: width,
      height: height,
      child: Text(
        text,
        style: const TextStyle(
          color: AppThemes.primaryColor,
          fontSize: 15,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
