import 'package:flutter/material.dart';
import 'package:tercer_reto/pages/contacto.dart';
import 'package:tercer_reto/pages/contacto_list.dart';
import 'package:tercer_reto/pages/header.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tercer Reto Platzi',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        body: Column(
          children: [
            Header(), // Tu widget Header personalizado
            Expanded(
              child: CustomScrollView(
                slivers: [
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                        return Contacto(
                            nombre_persona:
                                'Persona $index'); // Asegúrate de que esta clase esté importada correctamente
                      },
                      childCount:
                          1000, // Ajusta este número según tus necesidades
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
