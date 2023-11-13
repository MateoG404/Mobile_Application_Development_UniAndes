import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:platzi_app/home_trip.dart';
import 'package:platzi_app/profile_trips.dart';
import 'package:platzi_app/search_trips.dart';

class PlatziTripsCupertino extends StatelessWidget {
  // Variables
  var indexTap = 0;
  final List<Widget> widgetsChildren = [
    HomeTrips(),
    SearchTrips(),
    ProfileTrips()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: CupertinoTabScaffold(
            tabBar: CupertinoTabBar(
                activeColor: Colors.indigo,
                backgroundColor: Colors.transparent,
                items: const [
                  BottomNavigationBarItem(
                    icon: Padding(
                      padding: EdgeInsets.only(top: 10, bottom: 10),
                      child: Icon(Icons.home,
                          color: Color.fromRGBO(66, 165, 245, 1)),
                    ),
                    label: "",
                  ),
                  BottomNavigationBarItem(
                    icon: Padding(
                      padding: EdgeInsets.only(top: 10, bottom: 10),
                      child: Icon(Icons.search,
                          color: Color.fromRGBO(66, 165, 245, 1)),
                    ),
                    label: "",
                  ),
                  BottomNavigationBarItem(
                    icon: Padding(
                      padding: EdgeInsets.only(top: 10, bottom: 10),
                      child: Icon(Icons.person,
                          color: Color.fromRGBO(66, 165, 245, 1)),
                    ),
                    label: "",
                  ),
                ]),
            tabBuilder: (BuildContext context, int index) {
              return CupertinoTabView(builder: (BuildContext context) {
                switch (index) {
                  case 0:
                    return CupertinoPageScaffold(
                      child: HomeTrips(),
                    );
                  case 1:
                    return CupertinoPageScaffold(
                      child: SearchTrips(),
                    );
                  default:
                    return CupertinoPageScaffold(child: ProfileTrips());
                }
              });
            }));
  }
}
