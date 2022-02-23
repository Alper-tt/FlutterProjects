import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: TurkishFlag());
  }
}

class TurkishFlag extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          redBox,
          Positioned(top: 50, left: 50, child: moonW),
          Positioned(top: 60, left: 72.5, child: moonR),
          Positioned(
              top: 75,
              left: 140,
              child: Transform.rotate(
                  alignment: Alignment.center, angle: 60, child: star)),
        ],
      ),
    );
  }
}

Widget star = Icon(
  Icons.star,
  size: 50,
  color: Colors.white,
);
Widget redBox = Container(height: 200, width: 300, color: Colors.red);
Widget moonW = Container(
  height: 100,
  width: 100,
  decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white),
);
Widget moonR = Container(
  height: 80,
  width: 80,
  decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.red),
);
