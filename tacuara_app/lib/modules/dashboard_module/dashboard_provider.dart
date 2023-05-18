import 'package:flutter/material.dart';

class DashboardProvider extends ChangeNotifier {
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
  List<String> cabanafamiliar = [
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
}
