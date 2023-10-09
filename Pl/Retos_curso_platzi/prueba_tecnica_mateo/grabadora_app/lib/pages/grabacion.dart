import 'package:flutter/material.dart';
import 'package:grabadora_app/pages/boton_reproduccion.dart';

class Grabacion extends StatelessWidget {
  // ignore: non_constant_identifier_names
  final String titulo_grabacion;
  // ignore: non_constant_identifier_names
  final String descripcion_grabacion;

  const Grabacion(
      {Key? key,
      // ignore: non_constant_identifier_names
      required this.titulo_grabacion,
      // ignore: non_constant_identifier_names
      required this.descripcion_grabacion})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final nombreGrabacion = Container(
      margin: const EdgeInsets.only(left: 20),
      child: Text(
        titulo_grabacion,
        style: const TextStyle(
            fontSize: 22, color: Colors.white, fontWeight: FontWeight.bold),
        overflow: TextOverflow.ellipsis,
      ),
    );

    final descripcion = Container(
      margin: const EdgeInsets.only(left: 20),
      child: Text(
        descripcion_grabacion,
        style: const TextStyle(
            fontSize: 12, color: Colors.white54, fontWeight: FontWeight.normal),
        overflow: TextOverflow.ellipsis,
      ),
    );

    final nombreDescirpionGrabacion = Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [nombreGrabacion, descripcion],
      ),
    );
    final divider = Divider(
      color: Colors.white30,
    );
    return Container(
        margin: EdgeInsets.only(top: 10, left: 20),
        color: Colors.black,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                BotonReproduccion(),
                Expanded(
                    child: nombreDescirpionGrabacion), // Wrapped with Expanded
              ],
            ),
            Container(margin: EdgeInsets.only(top: 10), child: divider)
          ],
        ));
  }
}
