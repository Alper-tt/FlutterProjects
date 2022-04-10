import 'package:flutter/material.dart';

enum formStatus { signIn, register }

class EmailSignInPage extends StatefulWidget {
  const EmailSignInPage({Key? key}) : super(key: key);

  @override
  _EmailSignInPageState createState() => _EmailSignInPageState();
}

class _EmailSignInPageState extends State<EmailSignInPage> {
  formStatus _formStatus = formStatus.signIn;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign in Email"),
        
      ),
      body: Center(
        child: SingleChildScrollView(
          child: _formStatus == formStatus.signIn
              ? buildSignInForm()
              : buildRegisterForm(),
        ),
      ),
    );
  }

  Widget buildSignInForm() {
    final _signInFormKey = GlobalKey<FormState>();

    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Form(
        key: _signInFormKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.only(left: 40, right: 20, bottom: 20),
              child: Text(
                "Please Sign in...",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.only(left: 20, right: 30),
              child: TextFormField(
                validator: (value) {
                  if (!value!.contains('@')) {
                    return 'Invalid email address!';
                  } else {
                    null;
                  }
                },
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  hintText: "Email Address...",
                  prefixIcon: Icon(Icons.email_outlined),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50)),
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.only(left: 20, right: 30),
              child: TextFormField(
                validator: ((value) {
                  if (value!.length < 6) {
                    return 'Password must contain 6 character';
                  } else
                    null;
                }),
                textAlign: TextAlign.center,
                obscureText: true,
                decoration: InputDecoration(
                    hintText: "Password...",
                    prefixIcon: Icon(Icons.lock_outline),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50))),
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                print(_signInFormKey.currentState?.validate());
              },
              child: Text("Login"),
            ),
            TextButton(
                onPressed: () {
                  setState(() {
                    _formStatus = formStatus.register;
                  });
                },
                child: Text(
                  "Didn't You Sign Up ?",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ))
          ],
        ),
      ),
    );
  }

  Widget buildRegisterForm() {
    final _registerFormKey = GlobalKey<FormState>();
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Form(
        key: _registerFormKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.only(left: 40, right: 20, bottom: 20),
              child: Text(
                "Please Sign Up...",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.only(left: 20, right: 30),
              child: TextFormField(
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  hintText: "Email Address...",
                  prefixIcon: Icon(Icons.email_outlined),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50)),
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.only(left: 20, right: 30),
              child: TextFormField(
                keyboardType: TextInputType.visiblePassword,
                textAlign: TextAlign.center,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "Password...",
                  prefixIcon: Icon(Icons.lock_outline),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.only(left: 20, right: 30),
              child: TextFormField(
                textAlign: TextAlign.center,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "Password Again...",
                  prefixIcon: Icon(Icons.verified_user),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.only(left: 20, top: 30),
              child: ElevatedButton(
                onPressed: () {},
                child: Text("Register"),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: TextButton(
                  onPressed: () {
                    setState(() {
                      _formStatus = formStatus.signIn;
                    });
                  },
                  child: Text("Are You Already Registered ?")),
            )
          ],
        ),
      ),
    );
  }
}
