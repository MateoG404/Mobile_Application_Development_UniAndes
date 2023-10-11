import 'package:flutter/material.dart';
import 'package:flutter_sound_web/flutter_sound_recorder_web.dart';

class Record extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Record();
  }
}

class _Record extends State<Record> {
  var isRecording = true;
  final recorder = FlutterSoundRecorder();

  void onPressedRecord() async {
    setState(() {
      isRecording = !isRecording;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Positioned(
          top: 150, // Ajusta este valor para mover el círculo hacia arriba
          child: SizedBox(
            width: 120, // Ajusta el ancho del contenedor
            height: 120, // Ajusta la altura del contenedor
            child: FloatingActionButton(
              onPressed: onPressedRecord,
              shape: const CircleBorder(),
              elevation: 10,
              child: Icon(
                isRecording == false ? Icons.mic : Icons.stop,
                size: 40, // Ajusta el tamaño del ícono
              ),
            ),
          ),
        ),
      ],
    );
  }
}
