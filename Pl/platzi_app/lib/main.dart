import 'package:flutter/material.dart';
//import 'package:platzi_app/second_task.dart';
import 'package:platzi_app/description_place.dart';
import 'package:platzi_app/review.dart';
import 'package:platzi_app/review_list.dart';
import 'package:platzi_app/gradient_back.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: Scaffold(
            appBar: AppBar(
              title: const Text(
                "Hola ",
                style: TextStyle(color: Colors.white),
                textAlign: TextAlign.center,
              ),
              backgroundColor: Colors.black,
            ),
            //body: ReviewList())
            body: Stack(
              children: [
                ListView(
                  children: [
                    Description_place('Choconta', 4,
                        'Pueblo ubicado en Cundinamarca Colombia, cercano a Bogota a 2 horas'),
                    ReviewList()
                  ],
                ),
                GradientBack()
              ],
            )

            //Description_place("Mateo Gutierrez", 4,
            //    "Prueba de texto de descripción Prueba de texto de descripción Prueba de texto de descripciónPrueba de texto de descripción "),
            //)
            ));
  }
}