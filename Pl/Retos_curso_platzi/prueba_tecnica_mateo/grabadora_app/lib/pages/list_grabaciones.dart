import 'package:flutter/material.dart';
import 'package:grabadora_app/pages/reproduccir_grabacion.dart';

class ListaGrabaciones extends StatelessWidget {
  const ListaGrabaciones({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: SingleChildScrollView(
        // Wrap with SingleChildScrollView
        child: Column(
          children: [
            ReproduccirGrabacion(
              titulo_grabacion: "ddd",
              descripcion_grabacion: "Duracion 80 min",
            ),
            ReproduccirGrabacion(
              titulo_grabacion: "titulddo",
              descripcion_grabacion: "Duracion 80 min",
            ),
            ReproduccirGrabacion(
              titulo_grabacion: "titulddo",
              descripcion_grabacion: "Duracion 80 min",
            ),
          ],
        ),
      ),
    );
  }
}
