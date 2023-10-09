import 'package:flutter/material.dart';
import 'package:grabadora_app/pages/grabacion.dart';

class ListaGrabaciones extends StatelessWidget {
  const ListaGrabaciones({super.key});

  @override
  Widget build(BuildContext context) {
    final texto = Container(
        height: 100,
        width: MediaQuery.of(context).size.width,
        child: Container(
            margin: const EdgeInsets.only(top: 40, left: 20),
            child: const Text(
              'Mis grabaciones',
              textAlign: TextAlign.left,
              style: TextStyle(color: Colors.white, fontSize: 30),
            )));

    return Container(
      color: Colors.black, // Add this line for white background
      child: Column(children: [
        texto,
        Grabacion(
          titulo_grabacion: "titulddo",
          descripcion_grabacion: "Duracion 80 min",
        ),
        Grabacion(
          titulo_grabacion: "titulddo",
          descripcion_grabacion: "Duracion 80 min",
        ),
        Grabacion(
          titulo_grabacion: "titulddo",
          descripcion_grabacion: "Duracion 80 min",
        )
      ]),
    );
  }
}
