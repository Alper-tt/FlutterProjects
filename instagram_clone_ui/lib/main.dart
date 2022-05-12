import 'package:flutter/material.dart';
import 'package:instagram_clone_ui/Screens/HomePage/home_page.dart';
import 'package:instagram_clone_ui/Screens/HomePage/story_profile.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
