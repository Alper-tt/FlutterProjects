import 'package:firebase/views/sign_in_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../views/home_page.dart';

class OnBoardWidget extends StatefulWidget {
  const OnBoardWidget({Key? key}) : super(key: key);

  @override
  _OnBoardWidgetState createState() => _OnBoardWidgetState();
}

class _OnBoardWidgetState extends State<OnBoardWidget> {
  bool? _islogged;

  @override
  void initState() {
    
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        print("User is currently signed out");
        _islogged = false;
      } else {
        print("Signed in");
        _islogged = true;
      }

      setState(() {});
      
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _islogged == null
        ? Center(child: CircularProgressIndicator())
        : _islogged!
            ? HomePage()
            : SignInPage();
  }
}
