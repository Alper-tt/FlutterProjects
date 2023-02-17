import 'package:flutter/material.dart';
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
        body: const MyWidget(),
      ),
    );
  }
}
