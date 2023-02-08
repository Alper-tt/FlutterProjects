import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:test/main.dart';
import 'package:test/screens/login_page.dart';
import 'package:test/screens/main_page.dart';

class helloScreen extends StatefulWidget {
  const helloScreen({super.key});

  @override
  State<helloScreen> createState() => _helloScreenState();
}

class _helloScreenState extends State<helloScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset("assets/rte.jpeg",
              colorBlendMode: BlendMode.modulate,
              color: Colors.orange.shade200,
              opacity: AlwaysStoppedAnimation(1),
            ),
            Text(
              "Hello!",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 40),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 70),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "Please login by using given credentials\nand enjoy your workplace.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black54, fontWeight: FontWeight.w500),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 45),
                    child: ElevatedButton(
                        child: Text(
                          "Sign in",
                          style: TextStyle(color: Colors.black),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              CupertinoPageRoute(
                                  fullscreenDialog: true,
                                  builder: (_) {
                                    return loginScreen(AuthMode: AuthMode.login,);
                                  }));
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orange.shade300,
                            fixedSize: Size(250, 40))),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("New here ? "),
                      CupertinoButton(
                          child: Text(
                            "Create account.",
                            style: TextStyle(
                                color: Colors.orange.shade300, fontSize: 15),
                          ),
                          padding: EdgeInsets.all(0),
                          onPressed: () {
                          Navigator.push(
                              context,
                              CupertinoPageRoute(
                                  fullscreenDialog: true,
                                  builder: (_) {
                                    return loginScreen(AuthMode: AuthMode.signup,);
                                  }));
                        },)
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
