import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test/data.dart';
import 'package:test/screens/hello_screen.dart';

void main() {
  runApp(MultiProvider(
    providers: [ChangeNotifierProvider<data>(create: (_) => data())],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: helloScreen());
  }
}
