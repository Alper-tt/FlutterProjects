import 'package:flutter/material.dart';

void main() {
  runApp(
    BenimUyg(),
  );
}

class BenimUyg extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blueGrey,
        body: SafeArea(
          child: Container(
            //transform: Matrix4.rotationZ(-0.2),
            width: 200,
            height: 100,
            alignment: Alignment.centerRight,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.redAccent,
              borderRadius: BorderRadiusDirectional.circular(16),
            ),
            margin: EdgeInsets.symmetric(horizontal: 100, vertical: 16),
            //margin: EdgeInsets.all(16),
            //margin: EdgeInsets.only(left: 16, top: 16),
            padding: EdgeInsets.all(25),
            child: Transform(
              alignment: FractionalOffset.center,
              transform: Matrix4.rotationZ(-1.6),
              child: Text('Alper'),
            ),
          ),
        ),
      ),
    );
  }
}
