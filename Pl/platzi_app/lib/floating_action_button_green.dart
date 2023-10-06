import 'package:flutter/material.dart';

class FloatingActionButtoneGreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _FloatingActionButtoneGreen();
  }
}
// Class for the different states

class _FloatingActionButtoneGreen extends State<FloatingActionButtoneGreen> {
  String mensaje_snackbar = "";
  bool isFav = false;

  // Action when the user press the fav button
  void onPressedFav() {
    setState(() {
      isFav = !isFav;
      if (isFav) {
        mensaje_snackbar = "Agregado a Favoritos";
      } else {
        mensaje_snackbar = "Eliminado de favoritos";
      }
    });
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
      mensaje_snackbar,
    )));
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.green[500],
      onPressed: () {
        onPressedFav();
      },
      mini: true,
      tooltip:
          "Agregar a favoritos", // Texto para que el usuario sepa que significa
      child:
          Icon(isFav == true ? Icons.favorite : Icons.favorite_border_outlined),
    );
  }
}
