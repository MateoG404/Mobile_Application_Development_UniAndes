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
              colors: [
                Color.fromRGBO(48, 79, 188, 1),
                Color.fromRGBO(20, 28, 140, 1)
              ],
              begin: FractionalOffset(0.0, 0.10),
              end: FractionalOffset(1.2, 0.5),
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
