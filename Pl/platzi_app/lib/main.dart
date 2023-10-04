import 'package:flutter/material.dart';
import 'package:platzi_app/button_purple.dart';
//import 'package:platzi_app/second_task.dart';
import 'package:platzi_app/description_place.dart';
import 'package:platzi_app/header_appbar.dart';
import 'package:platzi_app/review_list.dart';
import 'package:platzi_app/gradient_back.dart';
import 'package:platzi_app/card_image_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: Scaffold(

            //body: ReviewList())
            body: Stack(
          children: [
            ListView(
              children: [
                Description_place('Choconta', 4,
                    'orem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum'),
                ButtonPurple("Navegar"),
                ReviewList(),
              ],
            ),
            HeaderAppBar()
          ],
        )));
  }
}
