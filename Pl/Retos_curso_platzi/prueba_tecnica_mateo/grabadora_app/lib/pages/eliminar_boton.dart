import 'dart:io';

import 'package:flutter/material.dart';

class EliminarBoton extends StatelessWidget {
  final String path;
  final Function onDelete;

  EliminarBoton({required this.path, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    Future<void> cancelarAudio() async {
      try {
        final file = File(path);

        if (await file.exists()) {
          await file.delete();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Center(child: Text('El audio fue eliminado')),
              duration: Duration(seconds: 3),
            ),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Center(child: Text('El archivo no existe')),
              duration: Duration(seconds: 3),
            ),
          );
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Center(child: Text('Error al eliminar el archivo')),
            duration: Duration(seconds: 3),
          ),
        );
      }
    }

    return Container(
      width: 30,
      height: 30,
      child: FloatingActionButton(
        onPressed: cancelarAudio,
        shape: const CircleBorder(),
        child: const Icon(Icons.delete),
      ),
    );
  }
}
