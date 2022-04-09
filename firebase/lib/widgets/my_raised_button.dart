
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';

class mySignInButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Buttons buttonType;
  final String? text;
  final bool mini;

  mySignInButton(
      {required this.onPressed,
      required this.buttonType,
      this.text,
      this.mini=false});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 250,
      child: SignInButton(
        buttonType,
        onPressed: () {},
        text: text,
        mini: mini,
      ),
    );
  }
}
