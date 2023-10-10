import 'package:flutter/material.dart';
import 'package:grabadora_app/pages/boton_reproduccion.dart';

class ReproduccirGrabacion extends StatelessWidget {
  // ignore: non_constant_identifier_names
  final String titulo_grabacion;
  // ignore: non_constant_identifier_names
  final String descripcion_grabacion;

  const ReproduccirGrabacion(
      {Key? key,
      // ignore: non_constant_identifier_names
      required this.titulo_grabacion,
      // ignore: non_constant_identifier_names
      required this.descripcion_grabacion})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final nombreGrabacion = Container(
      margin: const EdgeInsets.only(left: 20, right: 20),
      child: Text(
        titulo_grabacion,
        style: const TextStyle(
            fontSize: 22, color: Colors.white, fontWeight: FontWeight.bold),
        overflow: TextOverflow.ellipsis,
      ),
    );

    final descripcion = Container(
      margin: const EdgeInsets.only(left: 20, right: 20),
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
      height: 8,
    );
    return Container(
        color: Colors.black,
        child: Column(
          children: [
            Container(
                margin: EdgeInsets.only(top: 10, left: 15, right: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    BotonReproduccion(),
                    Expanded(
                        child:
                            nombreDescirpionGrabacion), // Wrapped with Expanded
                  ],
                )),
            Container(
              child: divider,
              margin: EdgeInsets.only(top: 10, left: 4, right: 4),
            )
          ],
        ));
  }
}
