import 'package:flutter/material.dart';
import 'package:tacuara_app/utils/app_themes.dart';

class MyButtonWidget extends StatelessWidget {
  final VoidCallback onPressed;
  final Function? onLongPress;
  final Color color;
  final ShapeBorder shape;
  final String text;
  final double width;
  final double height;
  const MyButtonWidget(
      {super.key,
      required this.onPressed,
      this.onLongPress,
      required this.color,
      required this.shape,
      required this.text,
      required this.width,
      required this.height});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      onLongPress: () {
        onLongPress?.call();
      },
      color: color,
      shape: shape,
      minWidth: width,
      height: height,
      child: Text(
        text,
        style: const TextStyle(
          color: AppThemes.secundaryColor,
          fontSize: 15,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
