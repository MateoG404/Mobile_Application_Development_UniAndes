import 'package:flutter/material.dart';

class ListGrabaciones extends StatelessWidget {
  const ListGrabaciones({super.key});

  @override
  Widget build(BuildContext context) {
    final texto = Container(
        height: 100,
        width: MediaQuery.of(context).size.width,
        child: Container(
            margin: const EdgeInsets.only(top: 40, left: 20),
            child: const Text(
              'Mis grabaciones',
              textAlign: TextAlign.left,
              style: TextStyle(color: Colors.black, fontSize: 30),
            )));

    return Container(
      color: Colors.white, // Add this line for white background
      child: Column(children: [texto]),
    );
  }
}
