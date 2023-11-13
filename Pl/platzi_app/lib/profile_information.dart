import 'package:flutter/material.dart';
import 'package:platzi_app/gradient_back.dart';

class ProfileInformation extends StatelessWidget {

  final path_image = 
  final imagen_perfil = Container(
    child: Image(image: path_image),
  );

  final profile_name = Container(
    child: Text("Mateo Gutierrez"),
  );

  final informacion_texto = Column(children: [profile_name]);

  final profile_info = Container(
    child: Row(children: [imagen_perfil, informacion_texto]),
  );

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [GradientBack("Profile")],
    );
  }
}
