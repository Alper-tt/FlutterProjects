import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xffb0bec5),
        appBar: AppBar(
          backgroundColor: Colors.blueGrey[800],
          title: Center(child: Text('Mutlu Bayramlar')),
        ),
        body: Center(
          child: Container(width: 500,
            height: 400,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage('images/images.jpeg'),
              ),
            ),
          ),
        ),
      ),
    ),
  );
}
