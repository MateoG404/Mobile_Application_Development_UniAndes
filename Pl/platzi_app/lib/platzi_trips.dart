import 'package:flutter/material.dart';
import 'package:platzi_app/home_trip.dart';
import 'package:platzi_app/platzi_trips_cupertino.dart';
import 'package:platzi_app/profile_trips.dart';
import 'package:platzi_app/search_trips.dart';

class PlatziTrips extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _PlatziTrips();
  }
}

class _PlatziTrips extends State<PlatziTrips> {
  // Variables
  var indexTap = 0;
  final List<Widget> widgetsChildren = [
    HomeTrips(),
    SearchTrips(),
    ProfileTrips()
  ];

  void onTapTapped(int index) {
    // Lista con elementos que se deben mostrar
    setState(() {
      // Control el estado del widget+
      indexTap = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: widgetsChildren[indexTap],
        bottomNavigationBar: PlatziTripsCupertino());
  }
}
