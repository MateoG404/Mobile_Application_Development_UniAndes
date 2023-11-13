import 'package:flutter/material.dart';

class AgregarNombres extends StatefulWidget {
  @override
  _AgregarNombresState createState() => _AgregarNombresState();
}

class _AgregarNombresState extends State<AgregarNombres> {
  // Variable para mostrar texto
  bool boolTexto = false;
  final TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final mostrarTexto = SizedBox(
        width: 250,
        child: TextField(
            obscureText: true,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Password',
            )));

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        TextButton(
          child: Text("Agregar Nombres"),
          onPressed: () {
            textController.clear();
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text("Ingrese el nombre"),
                  content: TextField(
                    controller: textController,
                    decoration: InputDecoration(
                      hintText: "Nombre",
                    ),
                  ),
                  actions: <Widget>[
                    ElevatedButton(
                      child: Text("Guardar"),
                      onPressed: () {
                        // Aquí puedes manejar la información ingresada
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
