import 'package:flutter/material.dart';
import 'package:tacuara_app/utils/local_storage.dart';

import '../../../../utils/images.dart';

class DashboardProvider extends ChangeNotifier {
  bool isUseradmin = false;
  List dashboardImages = [
    Images.tacuara,
    Images.tacuara1,
    Images.cabana1,
    Images.cabana2,
    Images.cabana3,
  ];
  List<String> dayPass = [
    'Degustación café Huila',
    'Achiras',
    'Almuerzo tipo fiambre',
    'Foto de recuerdo',
    'Senderismo',
    'Experiencia los secretos del árbol',
    'Charla de conexión con la naturaleza',
    'Experiencia sesacional a nivel grupal',
    'Seguro de asistencia individual',
    'Acompañamiento de guía',
    'Parqueadero',
  ];
  List<String> eventos = [
    'Matrimonio',
    'Cumpleaños',
    'Aniversarios',
  ];

  Future<void> validateUserIsAdmin() async {
    debugPrint("User is admin ${await LocalStorage.getUserIsAdmin()}");
    isUseradmin = await LocalStorage.getUserIsAdmin() == "true";
    notifyListeners();
  }
}
