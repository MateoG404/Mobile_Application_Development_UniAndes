import 'package:flutter/material.dart';
import 'dart:math';

class Contacto extends StatelessWidget {
  final String path_image;
  final String nombre_persona;

  // Constructor to set the image path and persona_contador
  Contacto({Key? key, required this.nombre_persona})
      : path_image = "assets/images/imagen${Random().nextInt(4) + 1}.png",
        super(key: key) {
    print("->> $path_image");
  }

  @override
  Widget build(BuildContext context) {
    final foto = Container(
      height: 80,
      width: 80,
      margin: EdgeInsets.only(top: 5, left: 10),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(path_image),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.all(Radius.circular(60)),
      ),
    );

    final nombre = Container(
        margin: EdgeInsets.only(left: 16, top: 10),
        child: Text(
          nombre_persona,
          style: const TextStyle(
              fontSize: 22, fontWeight: FontWeight.w700, fontFamily: "Lato"),
          textAlign: TextAlign.left,
        ));

    final informacion = Container(
        margin: EdgeInsets.only(left: 10, top: 1),
        child: Text(
          nombre_persona,
          style: const TextStyle(
              fontSize: 18, fontWeight: FontWeight.w400, fontFamily: "Lato"),
          textAlign: TextAlign.left,
        ));

    final nombreInformacion = Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [nombre, informacion],
      ),
    );

    final contactar = Container(
      margin: const EdgeInsets.only(left: 130, right: 20),
      height: 35,
      width: 35,
      child: InkWell(
        borderRadius: const BorderRadius.horizontal(
            left: Radius.circular(10),
            right: Radius.circular(
                10)), // Asegura que el InkWell tenga las mismas esquinas redondeadas que el Container
        onTap: () {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(
            "Llamando a $nombre_persona",
          )));
        },
        child: Container(
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.horizontal(
                  left: Radius.circular(10), right: Radius.circular(10)),
              color: Colors.indigo[900]),
          child: const Center(
            child: Icon(Icons.call, color: Colors.white), // Icono agregado aquí
          ),
        ),
      ),
    );

    return Container(
      width: double.infinity,
      height: 100,
      margin: EdgeInsets.only(top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [foto, nombreInformacion, contactar],
      ),
    );
  }
}
