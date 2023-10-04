import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// ignore: must_be_immutable, camel_case_types
class Description_place extends StatelessWidget {
// Variables
  String namePlace;
  int stars;
  String textDescription;

  // Constructor

  Description_place(this.namePlace, this.stars, this.textDescription,
      {super.key});

  @override
  Widget build(BuildContext context) {
    final starHalf = Container(
      margin: const EdgeInsets.only(
        top: 323,
        right: 3.0,
      ),
      child: const Icon(
        Icons.star_half,
        color: Colors.yellow,
        size: 20,
      ),
    );

    final star = Container(
      margin: const EdgeInsets.only(
        top: 323,
        right: 3.0,
      ),
      child: const Icon(
        Icons.star,
        color: Colors.yellow,
        size: 20,
      ),
    );

    final starBorder = Container(
      margin: const EdgeInsets.only(
        top: 323,
        right: 3.0,
      ),
      child: const Icon(
        Icons.star_border,
        color: Colors.yellow,
        size: 20,
      ),
    );

    final titleStars = Row(
      children: [
        // Creacion Titulo
        Container(
          margin: const EdgeInsets.only(
            top: 320,
            left: 20,
            right: 20,
          ),
          child: Text(
            namePlace,
            style: const TextStyle(
                fontSize: 30, fontWeight: FontWeight.bold, fontFamily: "Lato"),
            textAlign: TextAlign.left,
          ),
        ),
        // Creación de estrellas
        Row(
          children: [star, star, star, starHalf, starBorder],
        )
      ],
    );

    final descriptionUser = Container(
        margin: const EdgeInsets.only(top: 15, left: 20, right: 20),
        child: Text(
          textDescription,
          textAlign: TextAlign.left,
          style: const TextStyle(
              fontSize: 20, fontWeight: FontWeight.w400, fontFamily: "Lato"),
        ));

    final descriptionPeople = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [titleStars, descriptionUser],
    );
    return descriptionPeople;
  }
}
