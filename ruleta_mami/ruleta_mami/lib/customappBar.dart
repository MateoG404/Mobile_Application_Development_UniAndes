import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: AppBar(
      title:
          Center(child: Text('Ruleta', style: TextStyle(color: Colors.white))),
      backgroundColor: Colors.black87,
      // Add more properties as needed
    ));
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
