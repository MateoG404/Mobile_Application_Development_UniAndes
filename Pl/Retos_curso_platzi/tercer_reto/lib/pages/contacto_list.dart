import 'package:flutter/material.dart';
import 'package:tercer_reto/pages/contacto.dart'; // Asegúrate de que esta importación sea correcta

class ContactoList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 100, // Puedes ajustar este número según tus necesidades
      itemBuilder: (BuildContext context, int index) {
        return Contacto(nombre_persona: 'Persona $index');
      },
    );
  }
}
