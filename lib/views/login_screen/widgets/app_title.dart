import 'dart:math';

import 'package:flutter/material.dart';

class AppTitle extends StatelessWidget {
  const AppTitle({super.key});

  @override
  Widget build(BuildContext context) {
 //   return Container();
   return Container(
      margin: EdgeInsets.only(bottom: 20.0),
      padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 94.0),
      transform: Matrix4.rotationZ(-8 * pi / 180)..translate(-10.0),
      // ..translate(-10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.amber,
        boxShadow: [
          BoxShadow(
            blurRadius: 8,
            color: Colors.black26,
            offset: Offset(0, 2),
          )
        ],
      ),
      child: Text(
        'Timeger',
        style: TextStyle(
          color: Colors.blue.shade500,
          fontSize: 50,
          fontFamily: 'Anton',
          fontWeight: FontWeight.normal,
        ),
      ),
    ); 
  } 
}
