import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travel_tog_ui/Widgets/PostWidget.dart';
import 'package:travel_tog_ui/Widgets/appbar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:  HomePageAppBar().appBar,
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
