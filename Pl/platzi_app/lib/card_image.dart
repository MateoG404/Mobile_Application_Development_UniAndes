import 'package:flutter/material.dart';

class CardImage extends StatelessWidget {
  String path_image = 'assets/images/choconta.jpeg';

  CardImage(this.path_image);

  @override
  Widget build(BuildContext context) {
    final card = Container(
      height: 350,
      width: 250,
      margin: EdgeInsets.only(top: 80, bottom: 10, left: 20),
      decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(path_image)),
          borderRadius: const BorderRadius.all(Radius.elliptical(60, 60)),
          shape: BoxShape.rectangle,
          boxShadow: const [
            BoxShadow(
                color: Colors.black38, blurRadius: 15, offset: Offset(0.0, 7))
          ]),
    );

    return card;
  }
}
