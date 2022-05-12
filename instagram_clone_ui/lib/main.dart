import 'package:flutter/material.dart';
import 'package:instagram_clone_ui/Screens/HomePage/home_page.dart';
import 'package:instagram_clone_ui/feed/stories/stories.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(builder: (context, child) => MyApp(),providers: [
    ChangeNotifierProvider<Story>(create: (context) => Story())
  ]));
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
