import 'package:flutter/material.dart';
import 'package:grabadora_app/pages/boton_reproduccion.dart';

class Grabacion extends StatelessWidget {
  final String titulo_grabacion;
  final String descripcion_grabacion;

  Grabacion(
      {Key? key,
      required this.titulo_grabacion,
      required this.descripcion_grabacion})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final nombre_grabacion = Text(
      titulo_grabacion,
      style: const TextStyle(
          fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),
    );

    final descripcion = Text(
      descripcion_grabacion,
      style: const TextStyle(
          fontSize: 12, color: Colors.white54, fontWeight: FontWeight.normal),
    );

    final nombre_descirpion_grabacion = Column(
      crossAxisAlignment: CrossAxisAlignment
          .start, // Aligns children to the start of the column
      children: [nombre_grabacion, descripcion],
    );

    return Container(
      color: Colors.black,
      child: Row(
        children: [
          BotonReproduccion(),
          SizedBox(
              width: 20), // Adds some spacing between the button and the text
          nombre_descirpion_grabacion,
        ],
      ),
    );
  }
}
