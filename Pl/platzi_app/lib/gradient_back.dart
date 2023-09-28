import 'package:flutter/material.dart';

class GradientBack extends StatelessWidget {
  String title = "Popular";
  // Constructor
  GradientBack(this.title);

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
      alignment: const Alignment(-0.9, -0.6),
      child: Text(
        title,
        style: const TextStyle(
            color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
      ),
    );
  }
}
