import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math';

void main() {
  runApp(wsiet());
}

class wsiet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white10,
          centerTitle: true,
          title: Text(
            'WHAT SHOULD I EAT TODAY ?',
            style: GoogleFonts.amita(
              color: Colors.black,
            ),
          ),
        ),
        body: YemekSayfasi(),
      ),
    );
  }
}

class YemekSayfasi extends StatefulWidget {

  @override
  _YemekSayfasiState createState() => _YemekSayfasiState();
}

class _YemekSayfasiState extends State<YemekSayfasi> {
  int corbaNo = 1;
  int yemekNo = 1;
  int tatliNo = 1;

  List<String> corbaAdlari = [
    'Mercimek',
    'Tarhana',
    'Tavuksuyu',
    'Düğün Çorbası',
    'Yoğurtlu Çorba'
  ];
  List<String> yemekAdlari = [
    'Karnıyarık',
    'Mantı',
    'Kuru Fasulye',
    'İçli Köfte',
    'Balık'
  ];
  List<String> tatliAdlari = [
    'Kadayıf Sarma',
    'Baklava',
    'Sütlaç',
    'Kazandibi',
    'Dondurma'
  ];

  void degistir() {
    setState(() {
      corbaNo = Random().nextInt(5) + 1;
      yemekNo = Random().nextInt(5) + 1;
      tatliNo = Random().nextInt(5) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: FlatButton(
                highlightColor: Colors.white,
                splashColor: Colors.white,
                onPressed: degistir,
                child: Image.asset('images/corba_$corbaNo.jpg'),
              ),
            ),
          ),
          Text(corbaAdlari[corbaNo - 1],
          style: GoogleFonts.amita()),
          Container(
            width: 200,
            child: Divider(height: 10, color: Colors.black),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: FlatButton(
                highlightColor: Colors.white,
                splashColor: Colors.white,
                onPressed: degistir,
                child: Image.asset('images/yemek_$yemekNo.jpg'),
              ),
            ),
          ),
          Text(yemekAdlari[yemekNo - 1],
          style: GoogleFonts.amita()),
          Container(
            width: 200,
            child: Divider(height: 10, color: Colors.black),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: FlatButton(
                highlightColor: Colors.white,
                splashColor: Colors.white,
                onPressed: degistir,
                child: Image.asset('images/tatli_$tatliNo.jpg'),
              ),
            ),
          ),
          Text(tatliAdlari[tatliNo - 1],
          style: GoogleFonts.amita()),
          Container(
            width: 200,
            child: Divider(height: 10, color: Colors.black),
          ),
        ],
      ),
    );
  }
}
