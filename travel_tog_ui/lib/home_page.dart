import 'package:flutter/material.dart';
import 'package:travel_tog_ui/Widgets/PostWidget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
      itemCount: 5,
      itemBuilder: (context, index) {
        return Column(
          children: [
            PostWidget(),
          ],
        );
      },
    ));
  }
}
