import 'package:flutter/material.dart';

class DatePickerProvider extends ChangeNotifier {
  bool isRoomFamilyCabinAvalible = false;
  bool isRoomCouplesCabinAvalible = false;
  List<DateTime> selectedDates = [];

  DateTime dateTimeStart = DateTime.now();
  DateTime dateTimeEnd = DateTime.now().add(const Duration(days: 1));

  void addSelectedDate(DateTime date) {
    selectedDates.add(date);
    notifyListeners();
  }

  void removeSelectedDate(DateTime date) {
    selectedDates.remove(date);
    notifyListeners();
  }
}
