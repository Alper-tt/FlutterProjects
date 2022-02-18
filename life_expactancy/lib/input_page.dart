// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import './container.dart';
import './column.dart';
import './constants.dart';

class InputPage extends StatefulWidget {
  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String? selectedSex;
  double noc = 15;
  double noe = 3;
  int height = 170;
  int weight = 75;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'LİFE EXPACTANCY',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: MyContainer(
                    child: buildRowOutlineButton('height'),
                  ),
                ),
                Expanded(
                  child: MyContainer(
                    child: buildRowOutlineButton('weight'),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                    child: MyContainer(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('How many days a week do you exercise ?',
                          style: kTextStyle),
                      Text('${noe.round()}', style: kNumberStyle),
                      Slider(
                        min: 0,
                        max: 7,
                        value: noe,
                        divisions: 7,
                        onChanged: (double newValue) {
                          setState(() {
                            noe = newValue;
                          });
                        },
                      ),
                    ],
                  ),
                )),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                    child: MyContainer(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'How many cigarettes do you smoke per day ?',
                        style: kTextStyle,
                      ),
                      Text('${noc.round()}', style: kNumberStyle),
                      Slider(
                        min: 0,
                        max: 30,
                        value: noc,
                        onChanged: (double newValue) {
                          setState(() {
                            noc = newValue;
                          });
                        },
                      ),
                    ],
                  ),
                )),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: MyContainer(
                    onPress: () {
                      setState(() {
                        selectedSex = 'woman';
                      });
                    },
                    color:
                        selectedSex == 'woman' ? Colors.white70 : Colors.white,
                    child: MyColumn(
                      text: 'WOMAN',
                      icon: FontAwesomeIcons.venus,
                    ),
                  ),
                ),
                Expanded(
                  child: MyContainer(
                    onPress: () {
                      setState(() {
                        selectedSex = 'man';
                      });
                    },
                    color: selectedSex == 'man' ? Colors.white70 : Colors.white,
                    child: MyColumn(
                      text: 'MAN',
                      icon: FontAwesomeIcons.mars,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Row buildRowOutlineButton(String weightOrHeight) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RotatedBox(
          quarterTurns: 3,
          child: Text(weightOrHeight == 'weight' ? 'WEİGHT' : 'HEİGHT',
              style: kTextStyle),
        ),
        const SizedBox(width: 8),
        RotatedBox(
          quarterTurns: 3,
          child: Text(weightOrHeight == 'weight' ? '$weight' : '$height',
              style: kNumberStyle),
        ),
        const SizedBox(width: 10),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ButtonTheme(
              minWidth: 36,
              child: OutlineButton(
                borderSide: const BorderSide(color: Colors.lightBlue),
                onPressed: () {
                  setState(() {
                    weightOrHeight == 'weight' ? weight += 5 : height += 5;
                  });
                },
                child: const Icon(FontAwesomeIcons.plus, size: 10),
              ),
            ),
            ButtonTheme(
              minWidth: 36,
              child: OutlineButton(
                borderSide: const BorderSide(color: Colors.lightBlue),
                onPressed: () {
                  setState(() {
                    weightOrHeight == 'weight' ? weight -= 5 : height -= 5;
                  });
                },
                child: const Icon(FontAwesomeIcons.minus, size: 10),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
