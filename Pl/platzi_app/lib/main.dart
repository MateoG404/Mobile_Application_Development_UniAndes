import 'package:flutter/material.dart';
import 'package:platzi_app/button_purple.dart';
import 'package:platzi_app/description_place.dart';
import 'package:platzi_app/header_appbar.dart';
import 'package:platzi_app/platzi_trips.dart';
import 'package:platzi_app/review_list.dart';

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
        home: PlatziTrips());
  }
}
