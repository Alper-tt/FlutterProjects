import 'package:flutter/material.dart';
import 'package:travel_tog_ui/Pages/home_page.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: ElevatedButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return HomePage();
              }));
            },
            child: Icon(Icons.abc)));
  }
}
