import 'package:flutter/material.dart';

class GradientBack extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.blue, Colors.lightBlueAccent],
              begin: FractionalOffset(0.2, 0.8),
              end: FractionalOffset(1.0, 0.6),
              stops: [0.1, 0.6],
              tileMode: TileMode.clamp)),
    );
  }
}
