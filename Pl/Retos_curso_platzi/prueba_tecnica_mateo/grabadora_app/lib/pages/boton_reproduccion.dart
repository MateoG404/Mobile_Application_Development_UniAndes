import 'package:flutter/material.dart';

class BotonReproduccion extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _BotonReproduccion();
  }
}
// Class for the different states

class _BotonReproduccion extends State<BotonReproduccion> {
  String mensaje_snackbar = "";
  bool isPlay = false;

  void onPressPlay() {
    setState(() {
      isPlay = !isPlay;
    });
  }

  @override
  Widget build(BuildContext context) {
    double buttonSize = 56.0; // Tamaño estándar de un FloatingActionButton
    return FloatingActionButton(
      onPressed: () {
        onPressPlay();
      },
      backgroundColor: Colors.white,

      tooltip:
          "Reproducir", // Texto de ayuda para que el usuario sepa que pasa con el boton
      child: Icon(
        isPlay == false
            ? Icons.play_circle_outlined
            : Icons.pause_circle_outline_outlined,
        color: Colors.black,
        size: buttonSize - 16,
      ),
    );
  }
}
