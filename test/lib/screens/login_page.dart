import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:provider/provider.dart';
import 'package:test/data.dart';
import 'package:test/screens/main_page.dart';

class loginScreen extends StatelessWidget {
  const loginScreen({super.key, this.AuthMode});
  final AuthMode;

  @override
  Widget build(BuildContext context) {
    List<LoginData> datas = Provider.of<data>(context).datas;
    return FlutterLogin(
      initialAuthMode: AuthMode,
      onLogin: (data) async {
        if (datas.contains(data)) {
          MaterialPageRoute(builder: (_) => MainPage());
        } else {
          MaterialPageRoute(builder: (_) => loginScreen());
          return "false";
        }
      },
      onSubmitAnimationCompleted: () {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => MainPage()));
      },
      onRecoverPassword: (_) {},
      theme: LoginTheme(primaryColor: Colors.orange.shade300),
      logo: "assets/rte.jpeg",
    );
  }
}
