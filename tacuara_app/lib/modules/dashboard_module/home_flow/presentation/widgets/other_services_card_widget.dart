import 'package:flutter/material.dart';

import '../../../../../utils/app_themes.dart';

class OtherServicesCardWidget extends StatefulWidget {
  final String title;
  final String image;
  final Function onTap;
  const OtherServicesCardWidget(
      {super.key,
      required this.title,
      required this.image,
      required this.onTap});

  @override
  State<OtherServicesCardWidget> createState() =>
      _OtherServicesCardWidgetState();
}

class _OtherServicesCardWidgetState extends State<OtherServicesCardWidget> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: size.width * 0.05,
        vertical: size.height * 0.025,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.title,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
              GestureDetector(
                onTap: () => widget.onTap.call(),
                child: const Text(
                  'Ver más',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: AppThemes.primaryColor,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: size.height * 0.03,
          ),
          GestureDetector(
            onTap: () => widget.onTap.call(),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                widget.image,
                width: size.width,
                height: size.height * 0.15,
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
