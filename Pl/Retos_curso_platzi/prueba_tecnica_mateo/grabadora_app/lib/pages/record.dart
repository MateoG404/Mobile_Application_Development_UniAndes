import 'package:flutter/material.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

import 'package:permission_handler/permission_handler.dart';

class Record extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Record();
  }
}

class _Record extends State<Record> {
  var isRecording = false;
  final recorder = FlutterSoundRecorder();

  @override
  void initState() {
    super.initState();
    initRecorder();
  }

  Future<void> initRecorder() async {
    final status = await Permission.microphone.request();

    if (status != PermissionStatus.granted) {
      throw 'Microfono permiso fallido';
    }
    await recorder.openRecorder();
    print("FlutterSoundRecorder abierto: ${recorder.isRecording}");
  }

  Future<void> record() async {
    final directory = await getApplicationDocumentsDirectory();
    final path = Directory('${directory.path}/audio_files');
    if (!await path.exists()) {
      await path.create(recursive: true);
    }
    final filePath = '${path.path}/audio_file.aac';
    await recorder.startRecorder(toFile: filePath, codec: Codec.aacADTS);
    setState(() {
      isRecording = true;
    });
  }

  Future<void> stop() async {
    await recorder.stopRecorder();
    setState(() {
      isRecording = false;
    });
  }

  void onPressedRecord() {
    if (isRecording) {
      stop();
    } else {
      record();
    }
  }

  @override
  void dispose() {
    recorder.closeRecorder();
    super.dispose();
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
              onPressed: onPressedRecord,
              shape: const CircleBorder(),
              elevation: 10,
              child: Icon(
                isRecording == false ? Icons.mic : Icons.stop,
                size: 40,
              ),
            ),
          ),
        ),
        Positioned(
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
            ))
      ],
    );
  }
}
