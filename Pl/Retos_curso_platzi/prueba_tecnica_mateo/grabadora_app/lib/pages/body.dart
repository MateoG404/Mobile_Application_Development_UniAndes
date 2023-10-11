import 'package:flutter/material.dart';
import 'package:grabadora_app/pages/list_grabaciones.dart';
import 'package:grabadora_app/pages/record.dart';

class BodyClass extends StatefulWidget {
  @override
  _BodyClassState createState() => _BodyClassState();
}

class _BodyClassState extends State<BodyClass>
    with SingleTickerProviderStateMixin {
  late String titulo = "Grabar";
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
        title: Text(
          titulo,
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white, fontSize: 30),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                RecordClass(),
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
            Tab(
                icon: Icon(Icons.fiber_manual_record, color: Colors.blue),
                text: 'Grabar'),
            Tab(icon: Icon(Icons.list_sharp), text: 'Ver Audios'),
          ],
        ),
      ),
    );
  }
}
