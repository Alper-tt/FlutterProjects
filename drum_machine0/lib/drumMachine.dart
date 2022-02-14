import 'package:flutter/material.dart';

void main() {
  runApp(DrumMachine());
}

class DrumMachine extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
            child: Container(
              child: Column(
                children: [
                  Column(
                    children: [
                      Container(
                        width: 100,
                        height: 100,
                        color: Colors.blueAccent,
                      ),
                      Container(
                        width: 100,
                        height: 100,
                        color: Colors.blueAccent,
                      ),
                      Container(
                        width: 100,
                        height: 100,
                        color: Colors.blueAccent,
                      ),
                      Container(
                        width: 100,
                        height: 100,
                        color: Colors.blueAccent,
                      ),
                    ],
                  ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [Container(
                    width: 200,
                    height: 100,
                    color: Colors.blueAccent,
                  ),
                    Container(
                      width: 100,
                      height: 100,
                      color: Colors.blueAccent,
                    ),
                    Container(
                      width: 100,
                      height: 100,
                      color: Colors.blueAccent,
                    ),
                    Container(
                      width: 100,
                      height: 100,
                      color: Colors.blueAccent,
                    ),],
                ),
                ],
              ),
            ),
          ),
        ),
    );
  }
}
