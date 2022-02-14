import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(DrumMachine());
}

class DrumMachine extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: DrumPage(),
      ),
    );
  }
}

class DrumPage extends StatelessWidget {
  DrumPage({Key? key}) : super(key: key);

  final player = AudioCache();
  void play(String ses) {
    player.play('$ses.wav');
  }

  FlatButton buildDrumPad(String ses, Color color) {
    return FlatButton(
      padding: EdgeInsets.all(8),
      onPressed: () => play('$ses'),
      child: Container(
        color: color,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: buildDrumPad('bip', Colors.blue),
                ),
                Expanded(
                  child: buildDrumPad('bongo', Colors.orange),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: buildDrumPad('clap1', Colors.purple),
                ),
                Expanded(
                  child: buildDrumPad('clap2', Colors.grey),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: buildDrumPad('clap3', Colors.yellow),
                ),
                Expanded(
                  child: buildDrumPad('crash', Colors.lightBlueAccent),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: buildDrumPad('how', Colors.pinkAccent),
                ),
                Expanded(
                  child: buildDrumPad('oobah', Colors.brown),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
