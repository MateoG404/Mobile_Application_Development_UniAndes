import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';

class MyFortuneWheel extends StatefulWidget {
  @override
  _MyFortuneWheelState createState() => _MyFortuneWheelState();
}

class _MyFortuneWheelState extends State<MyFortuneWheel> {
  StreamController<int> selected = StreamController<int>();

  @override
  void dispose() {
    selected.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 50),
        height: 400, // Altura fija
        child: Column(
          children: [
            Expanded(
              child: FortuneWheel(
                selected: selected.stream,
                items: [
                  FortuneItem(child: Text('Item 1')),
                  FortuneItem(child: Text('Item 2')),
                  // Agrega más ítems aquí
                ],
              ),
            ),
            TextButton(
              child: Text('Girar Ruleta'),
              onPressed: () {
                selected.add(Random().nextInt(2));
              },
            ),
          ],
        ));
  }
}
