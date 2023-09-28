import 'package:flutter/material.dart';
import 'package:platzi_app/review.dart';

class ReviewList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Review("assets/images/viajero.png", "Mateo Camelo", "1 Review 5 Photos",
            "Muy buen lugar"),
        Review("assets/images/viajero.png", "Mateo Camelo", "1 Review 5 Photos",
            "Muy buen lugar"),
        Review("assets/images/viajero.png", "Mateo Camelo", "1 Review 5 Photos",
            "Muy buen lugar"),
        Review("assets/images/viajero.png", "Mateo Camelo", "1 Review 5 Photos",
            "Muy buen lugar"),
      ],
    );
  }
}
