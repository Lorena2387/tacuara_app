import 'package:flutter/material.dart';
import 'package:tacuara_app/utils/app_themes.dart';

class MyBoton {
  final String texto;
  final VoidCallback onPressed;
  final Color color;
  final Color textColor;
  final double textSize;
  final double borderRadius;
  final double elevation;
  final EdgeInsetsGeometry padding;

  const MyBoton({
    required this.texto,
    required this.onPressed,
    this.color = AppThemes.primaryColor,
    this.textColor = AppThemes.secundaryColor,
    this.textSize = 17,
    this.borderRadius = 10,
    this.elevation = 8,
    this.padding = const EdgeInsets.all(12),
  });

  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Text(
        texto,
        style: TextStyle(
          color: textColor,
          fontSize: textSize,
        ),
      ),
      color: color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      elevation: elevation,
      padding: padding,
    );
  }
}
