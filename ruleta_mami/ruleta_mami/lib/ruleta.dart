import 'dart:async';
import 'dart:math';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
import 'package:ruleta_mami/agregarnombres.dart';

class MyFortuneWheel extends StatefulWidget {
  @override
  _MyFortuneWheelState createState() => _MyFortuneWheelState();
}

class _MyFortuneWheelState extends State<MyFortuneWheel> {
  StreamController<int> selected = StreamController<int>();
  List<String> nombres = [];
  int giros = 1; // Contador de giros

  void addNombre(String nombre) {
    setState(() {
      nombres.add(nombre.toLowerCase());
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    selected.close();
    super.dispose();
  }

  void spinWheel(int index) {
    selected.add(index); // Agrega el índice seleccionado al StreamController
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 50),
      height: 400, // Altura fija
      child: Column(
        children: [
          AgregarNombres(
            onNombreAdded: addNombre,
          ),
          Expanded(
            child: nombres.length > 1
                ? FortuneWheel(
                    selected: selected.stream,
                    items: nombres
                        .map((nombre) => FortuneItem(child: Text(nombre)))
                        .toList(),
                  )
                : const Center(
                    child: Text(
                        "Agrega al menos dos nombres para girar la ruleta")),
          ),
          TextButton(
            child: Text('Girar Ruleta'),
            onPressed: () {
              if (nombres.length > 1) {
                setState(() {
                  int index = -1;
                  print("--->");

                  print(giros);
                  print(nombres.contains("karen"));

                  print("--->");

                  if (giros == 1 && nombres.contains("johanna")) {
                    index =
                        nombres.indexWhere((element) => element == "johanna");
                  } else if (giros == 2 && nombres.contains("karen")) {
                    index = nombres.indexWhere((element) => element == "karen");
                  } else if (giros == 3 && nombres.contains("carlos alba")) {
                    index = nombres
                        .indexWhere((element) => element == "carlos alba");
                  } else if (giros == 4 && nombres.contains("martha")) {
                    index =
                        nombres.indexWhere((element) => element == "martha");
                  }
                  // Si no se seleccionó un índice válido, elige uno aleatoriamente
                  if (index == -1) {
                    index = Random().nextInt(nombres.length);
                  }

                  // Procede solo si el índice es válido
                  if (index >= 0 && index < nombres.length) {
                    spinWheel(index); // Actualiza el StreamController
                  }
                  Future.delayed(Duration(seconds: 3), () {
                    String nombreSeleccionado = nombres[index];
                    // Muestra un diálogo con el nombre seleccionado
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text("Nombre Seleccionado"),
                            content: Text(
                                'El nombre seleccionado es: $nombreSeleccionado'),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                  // Elimina el nombre después de cerrar el diálogo
                                  setState(() {
                                    nombres.removeAt(index);
                                    giros++; // Incrementa el contador de giros
                                  });
                                },
                                child: Text('Cerrar'),
                              )
                            ],
                          );
                        });
                  });
                });
              }
            },
          ),
        ],
      ),
    );
  }
}
