import 'package:flutter/material.dart';
import 'package:test/expense_widget.dart';

class state_card extends StatelessWidget {
  const state_card({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "History",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                      color: Colors.grey.shade800),
                ),
                Icon(
                  Icons.filter_alt_rounded,
                )
              ],
            ),
          ),
          expense_widget()
        ],
      ),
    );
  }
}
