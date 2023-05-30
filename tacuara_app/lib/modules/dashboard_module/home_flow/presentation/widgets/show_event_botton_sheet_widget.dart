import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tacuara_app/modules/dashboard_module/home_flow/provider/dashboard_provider.dart';
import '../../../../../utils/app_themes.dart';
import 'modal_bottom_sheet_widget.dart';

void showEventBottonSheetWidget({
  required BuildContext context,
}) {
  Size size = MediaQuery.of(context).size;
  var controller = Provider.of<DashboardProvider>(context, listen: false);
  return showBottomSheetWidget(
    context: context,
    title: 'Celebra tu evento con nosotros',
    content: [
      const Text(
        'Capacidad máxima 200 personas, como:',
        style: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w500,
        ),
      ),
      SizedBox(
        height: size.height * 0.03,
      ),
      GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 10 / 2,
              mainAxisSpacing: size.height * 0.02,
              crossAxisSpacing: size.width * 0.02,
              crossAxisCount: 2),
          itemCount: controller.eventos.length,
          itemBuilder: (BuildContext context, int index) {
            return SizedBox(
              width: size.width * 0.5,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.circle,
                    size: 10,
                    color: AppThemes.primaryColor,
                  ),
                  SizedBox(
                    width: size.width * 0.01,
                  ),
                  Expanded(
                      child: Text(
                    controller.eventos[index],
                    maxLines: 2,
                    style: const TextStyle(fontSize: 12),
                  ))
                ],
              ),
            );
          }),
      SizedBox(
        height: size.height * 0.01,
      ),
      const Text(
        'Incluye alquiler del lugar, no incluye alojamiento.',
        style: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w500,
        ),
      ),
    ],
    onPressedButton: () {},
  );
}