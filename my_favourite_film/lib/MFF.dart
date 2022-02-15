import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: Center(
          child: SizedBox(
            height: 500,
            child: Image.network(
            'https://fav10.net/forum/attachments/inglourious-basterds-jpg.90520/'
            ),
          ),
        ),
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.redAccent,
          centerTitle: true,
          title: Text('My favourite film'),
        ),
      ),
    ),
  );
}
