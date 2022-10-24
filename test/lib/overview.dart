import 'package:flutter/material.dart';
import 'package:test/name_and_balance.dart';

import 'tab_butons.dart';

class OverView extends StatelessWidget {
  const OverView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: TextButton(
          child: Text(
            "A",
            style: TextStyle(
              fontSize: 23,
              color: Colors.black,
            ),
          ),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.segment,
              color: Colors.black,
            ),
            style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.white)),
          )
        ],
        backgroundColor: Colors.white,
        shadowColor: Colors.transparent,
        title: Text(
          "Account",
          style: TextStyle(color: Colors.black, fontSize: 16),
        ),
        centerTitle: true,
      ),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverList(delegate: SliverChildListDelegate([name_and_balance()]))
          ];
        },
        body: Column(
          children: [
            tab_buttons(),
          ],
        ),
      ),
    );
  }
}
