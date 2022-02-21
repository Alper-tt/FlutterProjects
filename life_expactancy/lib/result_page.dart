import 'package:flutter/material.dart';
import 'package:life_expactancy/calculation.dart';
import 'package:life_expactancy/constants.dart';
import 'package:life_expactancy/user_data.dart';

class ResultPage extends StatelessWidget {
  final UserData _userData;
  ResultPage(this._userData);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Result Page'),
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        Expanded(
            flex: 8,
            child: Center(
                child: Text(
              Calculation(_userData).calculate().round().toString(),
              style: kTextStyle,
            ))),
        Expanded(
            flex: 1,
            child: FlatButton(
              color: Colors.white,
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                'Back',
                style: kTextStyle,
              ),
            ))
      ]),
    );
  }
}
