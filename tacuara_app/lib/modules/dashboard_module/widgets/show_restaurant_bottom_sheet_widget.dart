import 'package:flutter/material.dart';

import 'modal_bottom_sheet_widget.dart';

void showRestaurantBottomSheetWidget({
  required BuildContext context,
}) =>
    showBottomSheetWidget(
        context: context,
        title: 'Visita nuestro restaurante',
        content: [
          const Text(
            'Ven y disfruta de nuestros platos especiales todos los fines de semana',
          ),
        ],
        onPressedButton: () {});
