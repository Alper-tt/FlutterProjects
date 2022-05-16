import 'package:flutter/material.dart';

class ShopPageButton extends StatelessWidget {
  const ShopPageButton({Key? key, required this.text}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: ElevatedButton(
        child: Text(
          text,
          style: TextStyle(color: Colors.black),
        ),
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: 20),
            shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.grey.shade400),
                borderRadius: BorderRadius.circular(7)),
            elevation: 0,
            primary: Colors.white),
      ),
    );
  }
}
