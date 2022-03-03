import 'package:flutter/material.dart';
import 'package:get_it_done/models/items_data.dart';
import 'package:get_it_done/screens/home_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider<ItemData>(create: (context) => ItemData(),
  child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
        primaryColor: Colors.green,
        scaffoldBackgroundColor: Colors.green,
        appBarTheme: const AppBarTheme(color: Colors.green),
        textTheme: const TextTheme(subtitle1: TextStyle(color: Colors.white),headline3: TextStyle(color: Colors.white)),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}
