import 'package:flutter/material.dart';

class Grabacion extends StatelessWidget {
  final String titulo_grabacion; // Nombre de la grabacion
  final String descripcion_grabacion; // Descripcion de la grabacion

  Grabacion(
      {Key? key,
      required this.titulo_grabacion,
      required this.descripcion_grabacion})
      : super(key: key); // Modify constructor

  @override
  Widget build(BuildContext context) {
    final nombre_grabacion = Container(
      margin: EdgeInsets.only(top: 10, left: 20),
      alignment: Alignment.centerLeft,
      child: Text(
        titulo_grabacion,
        style: const TextStyle(
            fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),
      ),
    );

    final descripcion = Container(
      margin: EdgeInsets.only(top: 10, left: 20),
      alignment: Alignment.centerLeft,
      child: Text(
        descripcion_grabacion, // Corrected this line
        style: const TextStyle(
            fontSize: 12, color: Colors.white54, fontWeight: FontWeight.normal),
      ),
    );
    final nombre_descirpion_grabacion =
        Column(children: [nombre_grabacion, descripcion]);
    return Column(
      children: [nombre_descirpion_grabacion],
    );
  }
}
