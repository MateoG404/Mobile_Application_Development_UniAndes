import 'package:flutter/material.dart';
import 'package:ruleta_mami/customappBar.dart';
import 'package:ruleta_mami/agregarnombres.dart';
import 'package:ruleta_mami/ruleta.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: CustomAppBar(),
          body: MyFortuneWheel() //Column(children: [MyFortuneWheel()]),
          // Add more properties as needed
          ),
    );
  }
}
