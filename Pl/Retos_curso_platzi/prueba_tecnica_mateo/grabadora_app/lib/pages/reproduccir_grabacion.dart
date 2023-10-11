import 'dart:async';

import 'package:audio_waveforms/audio_waveforms.dart';
import 'package:flutter/material.dart';
import 'package:grabadora_app/pages/boton_reproduccion.dart';
import 'package:grabadora_app/pages/eliminar_boton.dart';

class ReproduccirGrabacion extends StatefulWidget {
  final String titulo_grabacion;
  final String pathGrabacion;
  final void Function() onDelete;

  ReproduccirGrabacion({
    Key? key,
    required this.titulo_grabacion,
    required this.pathGrabacion,
    required this.onDelete,
  }) : super(key: key);

  @override
  _ReproducirGrabacionState createState() => _ReproducirGrabacionState();
}

class _ReproducirGrabacionState extends State<ReproduccirGrabacion> {
  late final PlayerController playerController;
  String audioDuration = "Calculando el tiempo ";

  @override
  void initState() {
    super.initState();
    playerController = PlayerController();
    // TODO: Add logic to get the audio duration and update `audioDuration`
  }

  @override
  Widget build(BuildContext context) {
    final nombreGrabacion = Container(
      margin: const EdgeInsets.only(left: 20, right: 20),
      child: Text(
        widget.titulo_grabacion,
        style: const TextStyle(
            fontSize: 22, color: Colors.white, fontWeight: FontWeight.bold),
        overflow: TextOverflow.ellipsis,
      ),
    );

    final descripcion = Container(
      margin: const EdgeInsets.only(left: 20, right: 20),
      child: Text(
        audioDuration,
        style: const TextStyle(
            fontSize: 16, color: Colors.white38, fontWeight: FontWeight.normal),
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

    const divider = Divider(
      color: Colors.white30,
      height: 8,
    );

    return Container(
      color: Colors.black,
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 10, left: 15, right: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                BotonReproduccion(pathGrabacion: widget.pathGrabacion),
                Expanded(child: nombreDescirpionGrabacion),
                EliminarBoton(
                  path: widget.pathGrabacion,
                  onDelete: widget.onDelete,
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10, left: 4, right: 4),
            child: divider,
          )
        ],
      ),
    );
  }
}
