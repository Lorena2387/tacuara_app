import 'package:flutter/material.dart';

class DialogWidget {
  static void showEmailAlreadyInUseDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Correo electrónico en uso'),
            content: const Text(
                'El correo ingresado ya está registrado, intente con otro correo'),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Cerrar'))
            ],
          );
        });
  }
}
