import 'package:flutter/material.dart';
import 'package:platzi_app/card_image.dart';

class CardImageList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        height: 350,
        child: ListView(
          padding: const EdgeInsets.all(25),
          scrollDirection: Axis.horizontal,
          children: [
            CardImage('assets/images/choconta.jpeg'),
            CardImage('assets/images/choconta.jpeg'),
            CardImage('assets/images/choconta.jpeg')
          ],
        ));
  }
}
