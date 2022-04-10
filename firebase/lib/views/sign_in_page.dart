import 'package:firebase/service/auth.dart';
import 'package:firebase/views/email_sign_in_page.dart';
import 'package:firebase/widgets/mySignInButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:provider/provider.dart';

class SignInPage extends StatefulWidget {
  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool _isLoading = false;

  Future<void> _signInAnonymously() async {
    setState(() {
      _isLoading = true;
    });

    final user =
        await Provider.of<Auth>(context, listen: false).signInAnonymously();
    setState(() {
      _isLoading = false;
    });

    print(user?.uid);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () async {
              Provider.of<Auth>(context, listen: false).signOut();
            },
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Sign In Page", style: TextStyle(fontSize: 25)),
            SizedBox(height: 30),
            SizedBox(
                height: 50,
                width: 250,
                child: SignInButtonBuilder(
                    icon: Icons.person,
                    backgroundColor:
                        _isLoading ? Colors.teal.withOpacity(0.3) : Colors.teal,
                    onPressed: () {
                      if (_isLoading) {
                        null;
                      } else {
                        _signInAnonymously();
                      }
                    },
                    text: "Sign in Anonymously")),
            SizedBox(height: 15),
            mySignInButton(
              buttonType: Buttons.Email,
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder:(context)=>EmailSignInPage()));
                },
                ),
            SizedBox(height: 15),
            mySignInButton(buttonType: Buttons.GoogleDark, onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
