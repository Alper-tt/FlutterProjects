import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_spinkit/flutter_spinkit.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final myController = TextEditingController();

  List<String> gifUrls = [];

  Future<void> getGIFs(String word) async {
    var gif = await http.get(Uri.parse(
        'https://g.tenor.com/v1/search?q=$word&key=LIVDSRZULELA&limit=8'));
    var gifParsed = jsonDecode(gif.body);
    gifUrls.clear();

    for (int i = 0; i < 8; i++) {
      print(gifParsed['results'][i]['media'][0]['gif']['url']);
      gifUrls.add(gifParsed['results'][i]['media'][0]['gif']['url']);
    }
    setState(() {});
  }

  void _showDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('${myController.text}" ==> NO GİF ABOUT IT!!!'),
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
  void initState() {
    getGIFs('stupid');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: Text('Tenor Gif'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 5),
                  child: TextField(
                    controller: myController,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(10)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blueGrey)),
                      hintText: 'Search a GIF...',
                      hintStyle: TextStyle(color: Colors.blueGrey),
                    ),
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                    ),
                  ),
                ),
              ),
              FlatButton(
                  color: Colors.grey,
                  onPressed: () {
                    getGIFs(myController.text);
                  },
                  child: Text(
                    'Search',
                    style: TextStyle(color: Colors.black),
                  )),
              gifUrls.isEmpty
                  ? SpinKitCubeGrid(
                      color: Colors.red,
                      size: 50,
                    )
                  : Container(
                      height: MediaQuery.of(context).size.height * 0.7,
                      child: Padding(
                        padding: EdgeInsets.all(8),
                        child: ListView.separated(
                          itemCount: 8,
                          itemBuilder: (context, index) {
                            return Container(
                              child: Image(
                                image: NetworkImage(gifUrls[index]),
                                fit: BoxFit.cover,
                              ),
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            return Divider(
                              thickness: 5,
                              color: Colors.blue,
                              height: 5,
                            );
                          },
                        ),
                      ),
                    )
            ],
          ),
        ),
      ),
    );
  }
}
