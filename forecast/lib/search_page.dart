import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String? selectedCity;
  final myController = TextEditingController();

  void _showDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('"${myController.text}" ==> INVALID City!!!'),
            actions: <Widget>[
              FlatButton(
                child: Text("Try again"),
                onPressed: () {
                  setState(() {});
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover, image: AssetImage('assets/search.jpg'))),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        backgroundColor: Colors.transparent,
        body: Center(
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 50),
                child: TextField(
                  controller: myController,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                      prefixIconConstraints: BoxConstraints(minWidth: 50),
                      prefixIcon: Icon(
                        Icons.place,
                        color: Colors.red,
                        size: 40,
                      ),
                      hintText: 'Type a city...',
                      border: OutlineInputBorder(borderSide: BorderSide())),
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
              ),
              FlatButton(
                  onPressed: () async {
                    var response = await http.get(Uri.parse(
                        'https://www.metaweather.com/api/location/search/?query=${myController.text}'));
                    jsonDecode(response.body).isEmpty
                        ? _showDialog()
                        : Navigator.pop(context, myController.text);
                  },
                  child: Text('Select to city'))
            ],
          ),
        ),
      ),
    );
  }
}
