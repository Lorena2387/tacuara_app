import 'package:flutter/material.dart';

import '../../../utils/app_themes.dart';

void showBottomSheetWidget({
  required BuildContext context,
  required String title,
  required List<Widget> content,
  required Function onPressedButton,
}) {
  Size size = MediaQuery.of(context).size;
  showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    builder: (_) {
      return SizedBox(
        width: size.width,
        height: size.height * 0.5,
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.05,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    width: size.width * 0.1,
                  ),
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      width: size.width * 0.1,
                      color: Colors.transparent,
                      child: const Icon(
                        Icons.close,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: size.height * 0.35,
              child: ListView(
                padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.09,
                  vertical: size.height * 0.04,
                ),
                children: content,
              ),
            ),
            SizedBox(
              width: size.width,
              height: size.height * 0.1,
              child: Container(
                margin: EdgeInsets.symmetric(
                  vertical: size.height * 0.025,
                  horizontal: size.width * 0.1,
                ),
                child: MaterialButton(
                  onPressed: () => onPressedButton.call(),
                  elevation: 10,
                  color: AppThemes.primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Text(
                    'Reservar',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: AppThemes.secundaryColor,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}
