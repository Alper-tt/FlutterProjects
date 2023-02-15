import 'package:flutter/material.dart';
import 'package:flutter_animated_icons/flutter_animated_icons.dart';
import 'package:travel_tog_ui/Pages/home_page.dart';
import 'package:travel_tog_ui/Pages/splash.dart';

void main() {
  runApp(const TravelTogUIMain());
}

class TravelTogUIMain extends StatefulWidget {
  const TravelTogUIMain({super.key});

  @override
  State<TravelTogUIMain> createState() => _TravelTogUIMainState();
}

class _TravelTogUIMainState extends State<TravelTogUIMain> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color.fromRGBO(217, 217, 217, 100),
        appBar: AppBar(),
        body: const MyWidget(),
      ),
    );
  }
}
