import 'package:flutter/material.dart';
import 'package:grabadora_app/pages/list_grabaciones.dart';

class Gratitude extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Icon(
        Icons.sentiment_satisfied,
        size: 120.0,
        color: Colors.lightGreen,
      ),
    );
  }
}

class Record extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Icon(
        Icons.fiber_manual_record_rounded,
        size: 120.0,
        color: Colors.blue,
      ),
    );
  }
}

class BodyClass extends StatefulWidget {
  @override
  _BodyClassState createState() => _BodyClassState();
}

class _BodyClassState extends State<BodyClass>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: const Text(
          'Mis grabaciones',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white, fontSize: 30),
        ),
      ),
      body: Column(
        children: [
          Center(
            child: Text(
              'Mis grabaciones',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black, fontSize: 30),
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                Record(),
                ListaGrabaciones(),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Material(
        color: Colors.black,
        child: TabBar(
          controller: _tabController,
          tabs: [
            Tab(icon: Icon(Icons.fiber_manual_record), text: 'Grabar'),
            Tab(icon: Icon(Icons.list_sharp), text: 'Ver Audios'),
          ],
        ),
      ),
    );
  }
}
