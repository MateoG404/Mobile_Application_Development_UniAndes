import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Changed Object to BuildContext
    final texto = Container(
        height: 100,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [
              Color.fromARGB(255, 0, 0, 50), // Alpha set to 255
              Color.fromARGB(255, 0, 97, 142) // Alpha set to 255
            ],
                begin: FractionalOffset(1, 0.92),
                end: FractionalOffset(0.15, 0.18),
                tileMode: TileMode.mirror)),
        child: Container(
            margin: EdgeInsets.only(top: 30),
            child: const Text(
              'Tus Contactos',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 30),
            )));
    return Container(
        color: Colors.black,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [texto],
        ));
  }
}
