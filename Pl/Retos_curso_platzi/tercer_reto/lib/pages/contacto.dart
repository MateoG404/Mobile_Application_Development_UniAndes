import 'package:flutter/material.dart';

class Contacto extends StatelessWidget {
  
  string path_image = ''
  @override
  Widget build(BuildContext context) {
    final foto = Container(
      decoration: BoxDecoration(image: AssetImage(path_image)),
    );
    final persona = Container(
      child: Column(),
    );
    return Row(
      children: [foto, persona],
    );
  }
}
