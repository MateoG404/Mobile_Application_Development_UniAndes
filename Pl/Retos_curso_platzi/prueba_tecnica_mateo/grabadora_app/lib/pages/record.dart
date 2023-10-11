import 'package:flutter/material.dart';

class Record extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Record();
  }
}

class _Record extends State<Record> {
  var isRecording = true;

  void onPressedRecord() {
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
          child: Container(
            width: 120, // Ajusta el ancho del contenedor
            height: 120, // Ajusta la altura del contenedor
            child: FloatingActionButton(
              onPressed: onPressedRecord,
              child: Icon(
                isRecording == false ? Icons.mic : Icons.stop,
                size: 40, // Ajusta el tamaño del ícono
              ),
              shape: CircleBorder(),
              elevation: 10,
            ),
          ),
        ),
      ],
    );
  }
}
