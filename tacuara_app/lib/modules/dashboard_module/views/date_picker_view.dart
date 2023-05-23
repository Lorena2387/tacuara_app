import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:tacuara_app/modules/dashboard_module/views/room_details_view.dart';
import 'package:tacuara_app/utils/app_themes.dart';

class DatePickerView extends StatefulWidget {
  const DatePickerView({super.key});

  @override
  State<DatePickerView> createState() => _DatePickerViewState();
}

class _DatePickerViewState extends State<DatePickerView> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Align(
              child: Container(
                child: Card(
                  child: SfDateRangePicker(
                    todayHighlightColor: AppThemes.primaryColor,
                    startRangeSelectionColor: AppThemes.primaryColor,
                    endRangeSelectionColor: AppThemes.primaryColor,
                    rangeSelectionColor: AppThemes.primaryColor,
                    minDate: DateTime.now(),
                    selectionMode: DateRangePickerSelectionMode.range,
                    initialSelectedRange: PickerDateRange(DateTime.now(),
                        DateTime.now().add(const Duration(days: 1))),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            MaterialButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (contex) => const RoomDetailsView()));
              },
              elevation: 8,
              minWidth: 220,
              height: 40,
              color: AppThemes.primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Text(
                'Continuar',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                  color: AppThemes.secundaryColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
