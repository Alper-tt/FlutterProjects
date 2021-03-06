import 'package:firebase/service/auth.dart';
import 'package:firebase/widgets/on_board.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider<Auth>(
      create: (context) => Auth(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Firebase',
        theme: ThemeData(
          primarySwatch: Colors.orange,
        ),
        home: OnBoardWidget(),
      ),
    );
  }
}
