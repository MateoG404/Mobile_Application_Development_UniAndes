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
  }

  Future<void> record() async {
    final directory = await getApplicationDocumentsDirectory();
    final path = Directory(
        '${directory.path}/audio_files'); // Create a subfolder named 'audio_files'

    if (!await path.exists()) {
      await path.create(
          recursive: true); // Create the folder if it doesn't exist
    }

    final filePath =
        '${path.path}/audio_file.aac'; // File will be saved in the 'audio_files' folder
    await recorder.startRecorder(toFile: filePath);
  }

  Future<void> stop() async {
    await recorder.stopRecorder();
  }

  void onPressedRecord() {
    if (isRecording) {
      stop();
    } else {
      record();
    }
    setState(() {
      isRecording = !isRecording;
    });
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
      ],
    );
  }
}
