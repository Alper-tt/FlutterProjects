import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: StackLesson());
  }
}

class StackLesson extends StatelessWidget {
  const StackLesson({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.centerLeft,
          children: [
            blueBox,
            Positioned(bottom: -10, right: -10, child: pinkBox),
            Positioned(
              child: star,
              bottom: 15,
              right: 15,
            ),
          ]),
    );
  }
}

Widget blueBox = Container(height: 200, width: 200, color: Colors.blueAccent);
Widget pinkBox = Container(height: 100, width: 100, color: Colors.pinkAccent);
Widget star = const Icon(Icons.star, size: 50, color: Colors.yellowAccent);
