import 'package:flutter/material.dart';
import 'package:test/widgets/credit_cards.dart';

class CardPage extends StatefulWidget {
  const CardPage({Key? key}) : super(key: key);

  @override
  State<CardPage> createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {
  bool conlesspay = false;
  bool onlinepay = false;
  bool atm = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        shadowColor: Colors.transparent,
        title: Text(
          "Cards",
          style: TextStyle(color: Colors.black, fontSize: 17),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Row(
                  children: [
                    Text("Virtual Card",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 19)),
                  ],
                ),
              ),
              CreditCards(),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Row(
                  children: [
                    Text("Card Settings",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 19)),
                  ],
                ),
              ),
              SwitchListTile(
                value: conlesspay,
                onChanged: (bool value) {
                  setState(() {
                    conlesspay = !conlesspay;
                  });
                },
                title: Text("Contactless Payment"),
              ),
              SwitchListTile(
                value: onlinepay,
                onChanged: (a) {setState(() {
                    onlinepay = !onlinepay;
                  });},
                title: Text("Online Payment"),
              ),
              SwitchListTile(
                value: false,
                onChanged: (a) {setState(() {
                    atm = !atm;
                  });},
                title: Text("ATM Withdrawls"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
