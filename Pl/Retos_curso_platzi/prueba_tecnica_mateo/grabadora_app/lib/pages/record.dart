import 'package:audio_waveforms/audio_waveforms.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:grabadora_app/pages/audio_visual_ondas.dart';
import 'package:record/record.dart';
import 'package:audioplayers/audioplayers.dart';
import 'dart:async';

class RecordClass extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _RecordClass();
  }
}

class _RecordClass extends State<RecordClass> {
  late final RecorderController recorderController;
  bool isRecording = false;
  late Record audioRecord;
  late AudioPlayer audioPlayer;
  String audioPath = '';
  late Timer _timer;
  Duration _duracion = Duration();

  @override
  void initState() {
    // Inicializar audioplayer
    audioPlayer = AudioPlayer();

    // Inicializar grabacion
    audioRecord = Record();

    // Iniciar recorder

    recorderController = RecorderController();

    super.initState();
  }

  @override
  void dispose() {
    //audioRecord.dispose();
    //audioPlayer.dispose();
    recorderController.dispose();
    super.dispose();
  }

  // Comenzar grabacion
  Future<void> record() async {
    try {
      // Check si hay permisos de grabacion
      if (await audioRecord.hasPermission()) {
        //await audioRecord.start();
        await recorderController.record();
        setState(() {
          isRecording = true;
        });
      }
      _timer = Timer.periodic(Duration(seconds: 1), (Timer t) {
        setState(() {
          _duracion += Duration(seconds: 1);
        });
      });
    } catch (e) {
      print("No se pudo iniciar la grabacion");
    }
  }

  Future<void> stop() async {
    try {
      //String? path = await audioRecord.stop();
      // Reiniciar la duración a cero
      _duracion = Duration.zero;
      final path = await recorderController.stop();

      setState(() {
        isRecording = false;
        audioPath = path!;
      });
      _timer.cancel();
    } catch (e) {
      print("NO se pudo parar la grabacion");
    }
  }

  Future<void> playRecording() async {
    try {
      Source urlSource = UrlSource(audioPath);
      await audioPlayer.play(urlSource);
    } catch (e) {
      print("error para reproducir");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Positioned(
          top: 150,
          child: SizedBox(
            width: 120,
            height: 120,
            child: FloatingActionButton(
              onPressed: () {
                isRecording ? stop() : record();
              },
              shape: const CircleBorder(),
              elevation: 10,
              child: Icon(
                isRecording == false ? Icons.mic : Icons.stop,
                size: 40,
              ),
            ),
          ),
        ),
        //ElevatedButton(onPressed: playRecording, child: const Text("Poner")),
        Positioned(
            top: 300,
            child: Container(
              child: Text(
                '${(_duracion.inMinutes % 60).toString().padLeft(2, '0')}:${(_duracion.inSeconds % 60).toString().padLeft(2, '0')}',
                style: TextStyle(color: Colors.white60, fontSize: 30),
              ),
            )),
        Positioned(
            top: 380,
            child: Container(
              width: 500,
              height: 50,
              child: AudioVisualOndas(recorderController: recorderController),
            )),
      ],
    );
  }
}
