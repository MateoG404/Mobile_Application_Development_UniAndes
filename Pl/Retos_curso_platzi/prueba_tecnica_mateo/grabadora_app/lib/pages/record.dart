import 'package:flutter/material.dart';
import 'package:flutter_sound/flutter_sound.dart';

class Record extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Record();
  }
}

class _Record extends State<Record> {
  var isRecording = false; // Variable to know if we are recording
  final recorder = FlutterSoundRecorder();

  @override
  void initState() {
    super.initState();
    initRecorder();
  }

  Future<void> initRecorder() async {
    await recorder.openRecorder();
  }

  Future<void> record() async {
    await recorder.startRecorder(toFile: 'path/to/your/file');
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
          top: 150, // Adjust this value to move the circle upwards
          child: SizedBox(
            width: 120, // Adjust the width of the container
            height: 120, // Adjust the height of the container
            child: FloatingActionButton(
              onPressed: onPressedRecord,
              shape: const CircleBorder(),
              elevation: 10,
              child: Icon(
                isRecording == false ? Icons.mic : Icons.stop,
                size: 40, // Adjust the size of the icon
              ),
            ),
          ),
        ),
      ],
    );
  }
}
