import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final myController = TextEditingController();

  List<String> gifUrls = [];

  Future<void> getGifs(String word) async {
    var response = await http.get(Uri.parse(
        'https://g.tenor.com/v1/search?q=$word&key=LIVDSRZULELA&limit=8'));
    var parsedResponse = jsonDecode(response.body);
    gifUrls.clear();

    for (int i = 0; i < 8; i++) {
      print(parsedResponse['results'][i]['media'][0]['gif']['url']);
      gifUrls.add(parsedResponse['results'][i]['media'][0]['gif']['url']);
    }

    setState(() {});
  }

  @override
  void initState() {
    getGifs('coder');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.blueGrey[800],
      appBar: AppBar(
        centerTitle: true,
        title: Text('GIF'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
            child: TextField(
              textAlign: TextAlign.center,
              controller: myController,
              decoration: InputDecoration(
                  hintText: 'Search a GIF...',
                  hintStyle: TextStyle(color: Colors.white),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: BorderSide(color: Colors.redAccent)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: BorderSide(color: Colors.redAccent))),
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 5),
            child: OutlineButton(
              borderSide: BorderSide(color: Colors.redAccent),
              onPressed: () {
                getGifs(myController.text);
              },
              child: Icon(
                Icons.search,
                size: 40,
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.9,
            height: MediaQuery.of(context).size.height * 0.65,
            child: ListView.separated(
              physics: BouncingScrollPhysics(),
              itemCount: gifUrls.length,
              itemBuilder: (context, index) {
                return gifUrls.isEmpty
                    ? CircularProgressIndicator()
                    : Container(
                        child: Image(
                        image: NetworkImage(
                          gifUrls[index],
                        ),
                        fit: BoxFit.cover,
                      ));
              },
              separatorBuilder: (BuildContext context, index) {
                return Divider(
                  height: 10,
                  color: Colors.black,
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
