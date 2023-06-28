import 'package:flutter/material.dart';
import 'package:tacuara_app/utils/local_storage.dart';

import '../../../../utils/images.dart';

class RoomProvider extends ChangeNotifier {
  int couplesCabinRate = 190000;
  int familyCabinRate = 490000;
  List<String> familyCabinImages = [
    Images.cabanafam1,
    Images.cabanafam2,
    Images.cabanafam3,
    Images.cabanafam4,
  ];
  List<String> familyCabinServices = [
    'Desayuno',
    'Servicio de piscina',
    'Parqueadero privado cubierto',
    'Wifi',
    'Televisión',
    'Baño privado',
    'Cama doble',
    'Camarote',
    'Cama auxiliar',
  ];
  List<String> couplesCabinServices = [
    'Desayuno',
    'Servicio de piscina',
    'Jacuzzi termal',
    'Ducha caliente',
    'Parqueadero privado cubierto',
    'Wifi',
    'Baño privado',
    'Cama doble',
  ];
  List<String> couplesCabinImages = [
    Images.cabanaParejas1,
    Images.cabanaParejas2,
    Images.cabanaParejas3,
  ];
  Future<String> getUid() async {
    return await LocalStorage.getUid() ?? '';
  }

  List<String> reservationCoupleCabin = [
    'Check In:',
    'Check Out:',
    'Precio por noche: \$190.000',
    'Numero de reserva:',
    'Tipo de habitación:',
    'Total:',
  ];
  String formatDate({required DateTime date}) {
    String year = date.year.toString();
    String month = date.month.toString();
    String day = date.day.toString();
    return '$day/$month/$year';
  }

  int calculateDays({required DateTime startDate, required DateTime endDate}) {
    int difference = endDate.difference(startDate).inDays;
    return difference;
  }

  int totalRate({required int dayRate, required int totalNights}) {
    return dayRate * totalNights;
  }
}
