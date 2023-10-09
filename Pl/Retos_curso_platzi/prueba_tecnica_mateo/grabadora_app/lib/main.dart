import 'package:flutter/material.dart';
import 'package:grabadora_app/pages/grabacion.dart';
import 'package:grabadora_app/pages/list_grabaciones.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.black, // Fondo blanco
        ),
        home: ListaGrabaciones());
  }
}
