import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blueGrey[800],
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                color: Colors.white,
                height: 100,
                child: Text('1.Con'),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 100,
                      width: 100,
                      color: Colors.redAccent,
                    ),
                    Container(
                      height: 100,
                      width: 100,
                      color: Colors.yellow,
                    ),
                  ],
                ),
              ),
              Container(
                color: Colors.blue,
                height: 100,
                child: Text('3.Cont'),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
