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
    return Container(
      child: FloatingActionButton(
        onPressed: onPressedRecord,
        child: Icon(
          isRecording == false ? Icons.mic : Icons.stop,
          size: 40,
        ),
        shape: CircleBorder(),
      ),
    );
  }
}
