import 'package:flutter/material.dart';

class DatePickerProvider extends ChangeNotifier {
  bool isRoomFamilyCabinAvalible = false;
  bool isRoomCouplesCabinAvalible = false;
  List<DateTime> selectedDates = [];

  late DateTime dateTimeStart;
  late DateTime dateTimeEnd;

  void addSelectedDate(DateTime date) {
    selectedDates.add(date);
    notifyListeners();
  }

  void removeSelectedDate(DateTime date) {
    selectedDates.remove(date);
    notifyListeners();
  }
}
