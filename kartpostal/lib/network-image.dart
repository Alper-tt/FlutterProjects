import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blueGrey[200],
        appBar: AppBar(
          backgroundColor: Colors.blueGrey[800],
          title: Center(
              child: Text('Mutlu Bayramlar')),
        ),
        body: Center(
          child: Image.network(
              'http://www.ttvets.com/tr/article/image/orginal/5b75205556959p1buj3v5mj1mbqjga30n1bn1k9a4.jpg'),
        ),
      ),
    ),
  );
}
