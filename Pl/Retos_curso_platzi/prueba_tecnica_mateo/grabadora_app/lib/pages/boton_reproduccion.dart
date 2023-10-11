import 'package:audio_waveforms/audio_waveforms.dart';
import 'package:flutter/material.dart';

class BotonReproduccion extends StatefulWidget {
  final String pathGrabacion;

  BotonReproduccion({required this.pathGrabacion, Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _BotonReproduccion();
  }
}

class _BotonReproduccion extends State<BotonReproduccion> {
  late final PlayerController playerController;
  bool isPlay = false;

  @override
  void initState() {
    super.initState();
    playerController = PlayerController();
  }

  Future<void> reproducirAudio() async {
    try {
      await playerController.preparePlayer(path: widget.pathGrabacion);
      await playerController.startPlayer();
    } catch (e) {
      print("error para reproducir");
    }
  }

  Future<void> stopAudio() async {
    try {
      await playerController.stopPlayer(); // Detener el reproductor
    } catch (e) {
      print("error para pausar");
    }
  }

  @override
  Widget build(BuildContext context) {
    double buttonSize = 56.0;
    return FloatingActionButton(
      onPressed: () {
        setState(() {
          isPlay = !isPlay;
        });
        if (isPlay) {
          reproducirAudio();
        } else {
          stopAudio();
        }
      },
      backgroundColor: Colors.white,
      tooltip: "Reproducir",
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
