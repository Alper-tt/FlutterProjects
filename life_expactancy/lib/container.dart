import 'package:flutter/material.dart';

class MyContainer extends StatelessWidget {
  Color color;
  Widget? child;
  var onPress;

  MyContainer({
    this.color = Colors.white,
    this.child,
    this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: child,
        margin: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
