import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:record/record.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

import 'package:permission_handler/permission_handler.dart';

class RecordClass extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _RecordClass();
  }
}

class _RecordClass extends State<RecordClass> {
  bool isRecording = false;
  late Record audioRecord;
  late AudioPlayer audioPlayer;
  String audioPath = '';

  void initilizer() async {}

  @override
  void initState() {
    // Inicializar audioplayer
    audioPlayer = AudioPlayer();

    // Inicializar grabacion
    audioRecord = Record();
    super.initState();
  }

  @override
  void dispose() {
    audioRecord.dispose();
    audioPlayer.dispose();
    super.dispose();
  }

  // Comenzar grabacion
  Future<void> record() async {
    try {
      // Check si hay permisos de grabacion

      if (await audioRecord.hasPermission()) {
        await audioRecord.start();
        setState(() {
          isRecording = true;
        });
      }
    } catch (e) {
      print("No se pudo iniciar la grabacion");
    }
  }

  Future<void> stop() async {
    try {
      String? path = await audioRecord.stop();

      setState(() {
        isRecording = false;
        audioPath = path!;
      });
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
        ElevatedButton(onPressed: playRecording, child: const Text("Poner"))
/*         Positioned(
            top: 300,
            child: Container(
              child: StreamBuilder<RecordingDisposition>(
                stream: recorder.onProgress,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    print(
                        "StreamBuilder tiene datos: ${snapshot.data!.duration}");
                  } else {
                    print("StreamBuilder no tiene datos");
                  }
                  final duracion = snapshot.hasData
                      ? snapshot.data!.duration
                      : Duration.zero;
                  return Text(
                    '${(duracion.inMinutes % 60).toString().padLeft(2, '0')}:${(duracion.inSeconds % 60).toString().padLeft(2, '0')}',
                    style: TextStyle(color: Colors.white60, fontSize: 30),
                  );
                },
              ),
            ))*/
      ],
    );
  }
}
