import 'package:flutter/material.dart';

class SecondTask extends StatelessWidget {
  const SecondTask({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Share"),
          backgroundColor: Colors.red[200],
          leading: BackButton(
            color: Colors.white,
            onPressed: () {},
          ),
        ),
        body: Center(
          child: SingleChildScrollView(
            reverse: false,
            child: Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/images.jpeg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: Container(
                    height: MediaQuery.of(context).size.height / 2,
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(color: Colors.black54),
                  ),
                ),
                Positioned(
                  bottom: MediaQuery.of(context).size.height /
                      2, // Position above the black container
                  child: Container(
                    height: 70,
                    padding: const EdgeInsets.all(10.0), // Add padding
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(color: Colors.black),
                    child: const Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Naughty',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white, fontSize: 30),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
