import 'package:flutter/material.dart';

class MyColumn extends StatelessWidget {
  final String text;
  final Widget? child;
  final IconData? icon;

  MyColumn({this.child, this.text = '', this.icon});

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(icon),
          SizedBox(height: 10),
          Text(
            text,
            style:
                TextStyle(color: Colors.black54, fontWeight: FontWeight.bold),
          )
        ]);
  }
}
