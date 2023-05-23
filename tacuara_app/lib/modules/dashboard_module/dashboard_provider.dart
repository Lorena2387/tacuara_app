import 'package:flutter/material.dart';

import '../../utils/images.dart';

class DashboardProvider extends ChangeNotifier {
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
  List<String> familyCabinImages = [
    Images.cabanafam1,
    Images.cabanafam2,
    Images.cabanafam3,
    Images.cabanafam4,
  ];
  List<String> familyCabinServices = [
    'Desayuno',
    'servicio de piscina',
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
}
