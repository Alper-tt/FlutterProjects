import 'package:firebase/widgets/my_raised_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

class SignInPage extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          BackButton(
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
            },
          )
        ],
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text("Sign In Page", style: TextStyle(fontSize: 25)),
          SizedBox(height: 30),
          SizedBox(
              height: 50,
              width: 250,
              child: SignInButtonBuilder(
                  icon: Icons.person,
                  backgroundColor: Colors.blueGrey,
                  onPressed: () async {
                    final userCredential =
                        await FirebaseAuth.instance.signInAnonymously();
                    print(userCredential.user?.uid);
                  },
                  text: "Sign in Anonymously")),
          SizedBox(height: 15),
          mySignInButton(buttonType: Buttons.GoogleDark, onPressed: () {}),
          SizedBox(height: 15),
          mySignInButton(onPressed: () {}, buttonType: Buttons.Email)
        ]),
      ),
    );
  }
}
