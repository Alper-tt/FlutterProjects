import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

class CreditCards extends StatefulWidget {
  const CreditCards({Key? key}) : super(key: key);

  @override
  _CreditCardsState createState() => _CreditCardsState();
}

class _CreditCardsState extends State<CreditCards> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: CreditCardWidget(
            cardNumber: "5052 0804 2132 3311 2222",
            expiryDate: "11/24",
            cardHolderName: "Alper Topraktepe",
            cvvCode: "052",
            showBackView: false,
            onCreditCardWidgetChange: (p0) {},
            isHolderNameVisible: true,
            bankName: "Garanti Bankası",
            obscureCardCvv: false,
            cardType: CardType.mastercard,
            glassmorphismConfig: Glassmorphism(
                blurX: 100,
                blurY: 0,
                gradient: RadialGradient(colors: [Colors.green, Colors.green])),
          ),
        ),
        CreditCardWidget(
          cardNumber: "0403 0804 2132 3311 4213",
          expiryDate: "07/27",
          cardHolderName: "Alper Topraktepe",
          cvvCode: "321",
          showBackView: false,
          onCreditCardWidgetChange: (p0) {},
          isHolderNameVisible: true,
          bankName: "Papara Black",
          obscureCardCvv: false,
          cardType: CardType.visa,
          glassmorphismConfig: Glassmorphism(
              blurX: 0,
              blurY: 0,
              gradient:
                  RadialGradient(colors: [Colors.black, Colors.blueGrey])),
        )
      ],
    );
  }
}
