import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:test/credit_cards.dart';

class CardPage extends StatelessWidget {
  const CardPage({Key? key}) : super(key: key);

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
              ListTile(title: Text("Contactless payment",
              ),trailing: ToggleButtons(children: [Icon(Icons.check)], isSelected: [true]),)
            ],
          ),
        ),
      ),
    );
  }
}
