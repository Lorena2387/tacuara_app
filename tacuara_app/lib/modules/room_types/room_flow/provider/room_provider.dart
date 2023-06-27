import 'package:flutter/material.dart';
import 'package:tacuara_app/utils/local_storage.dart';

import '../../../../utils/images.dart';

class RoomProvider extends ChangeNotifier {
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
  Future<String> getUid() async {
    return await LocalStorage.getUid() ?? '';
  }
}
