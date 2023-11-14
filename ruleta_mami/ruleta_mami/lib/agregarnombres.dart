import 'package:flutter/material.dart';

class AgregarNombres extends StatefulWidget {
  // Creación del callback
  final Function(String) onNombreAdded;
  AgregarNombres({Key? key, required this.onNombreAdded}) : super(key: key);

  @override
  _AgregarNombresState createState() => _AgregarNombresState();
}

class _AgregarNombresState extends State<AgregarNombres> {
  // Variable para mostrar texto
  bool boolTexto = false;
  final TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        TextButton(
          child: const Text("Agregar Nombres"),
          onPressed: () {
            textController.clear();
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text("Ingrese el nombre"),
                  content: TextField(
                    controller: textController,
                    decoration: const InputDecoration(
                      hintText: "Nombre",
                    ),
                  ),
                  actions: <Widget>[
                    ElevatedButton(
                      child: const Text("Guardar"),
                      onPressed: () {
                        // Llamar el callback
                        widget.onNombreAdded(textController.text);
                        print("Nombre guardado: ${textController.text}");
                        Navigator.of(context).pop(); // Cerrar el AlertDialog
                      },
                    ),
                  ],
                );
              },
            );
          },
        ),
      ],
    );
  }
}
