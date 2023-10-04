import 'package:flutter/material.dart';

class ButtonPurple extends StatelessWidget {
  String texto = 'Navegar';

  ButtonPurple(this.texto);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text("Navegando")));
      },
      child: Container(
        margin:
            const EdgeInsets.only(top: 10.0, left: 20, right: 220, bottom: 30),
        height: 30,
        width: 25,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30.0),
            gradient: LinearGradient(
                colors: [Colors.lightBlue, Colors.purple],
                begin: FractionalOffset(1.2, 0.9),
                end: FractionalOffset(0.15, 0.25),
                tileMode: TileMode.mirror)),
        child: Center(
          child:
              Text(texto, style: TextStyle(fontSize: 18, color: Colors.white)),
        ),
      ),
    );
  }
}
