import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {

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
            children: const <Widget>[
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 50),
                  child: TextField(
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                        prefixIconConstraints: BoxConstraints(minWidth: 50),
                        prefixIcon: Icon(
                          Icons.place,
                          color: Colors.red,
                          size: 40,
                        ),
                        hintText: 'Select City...',
                        border: OutlineInputBorder(borderSide: BorderSide())),
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
