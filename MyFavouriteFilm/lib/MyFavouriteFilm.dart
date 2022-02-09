import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.redAccent,
          title: Text('My Favourite Film'),
        ),
        body: Center(
          child: Image.network(
              'https://fav10.net/forum/attachments/inglourious-basterds-jpg.90520/'),
        ),
      ),
    ),
  );
}
