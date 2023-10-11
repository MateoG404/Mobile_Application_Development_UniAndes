import 'package:audio_waveforms/audio_waveforms.dart';
import 'package:flutter/material.dart';
import 'package:record/src/record.dart';
import 'dart:ui' as ui show Gradient;

class AudioVisualOndas extends StatefulWidget {
  final RecorderController recorderController;

  AudioVisualOndas({required this.recorderController});

  @override
  State<StatefulWidget> createState() {
    return _AudioVisualOndas();
  }
}

class _AudioVisualOndas extends State<AudioVisualOndas> {
  @override
  Widget build(BuildContext context) {
    return AudioWaveforms(
      enableGesture: false,
      shouldCalculateScrolledPosition: true,
      size: Size(MediaQuery.of(context).size.width, 20.0),
      recorderController: widget.recorderController,
      waveStyle: WaveStyle(
        waveColor: Colors.white,
        spacing: 8.0,
        showBottom: true,
        extendWaveform: true,
        showMiddleLine: false,
        gradient: ui.Gradient.linear(
          const Offset(70, 50),
          Offset(MediaQuery.of(context).size.width / 2, 0),
          [Colors.white54, Colors.purple],
        ),
      ),
    );
  }
}
