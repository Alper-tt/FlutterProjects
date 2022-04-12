import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(
    BenimUyg(),
  );
}

class BenimUyg extends StatefulWidget {
  @override
  State<BenimUyg> createState() => _BenimUygState();
}

class _BenimUygState extends State<BenimUyg> {
  String _instagramurl = 'https://www.instagram.com/alper.t.t/';
  String _facebookurl = 'https://www.facebook.com/Alper.Topraktepe';
  String _twitterurl = 'https://twitter.com/alpertt_';
  String _mail = 'mailto:alpertopraktepe46@gmail.com';
  String _tel = 'tel:+90-535-943-1412';

  void _launchiURL() async {
    if (!await launch(_instagramurl)) throw 'Could not launch $_instagramurl';
  }

  void _launchfURL() async {
    if (!await launch(_facebookurl)) throw 'Could not launch $_facebookurl';
  }

  void _launchtURL() async {
    if (!await launch(_twitterurl)) throw 'Could not launch $_twitterurl';
  }

  void _launchmail() async {
    if (!await launch(_mail)) throw 'Could not launch $_mail';
  }

  void _launchtel() async {
    if (!await launch(_tel)) throw 'Could not launch $_tel';
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.lightBlue[200],
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage('assets/images/a.jpeg'),
                  radius: 70,
                  backgroundColor: Colors.blue,
                ),
                Text(
                  'Contact Page',
                  style: TextStyle(
                    fontFamily: 'Rubik',
                    color: Colors.blueGrey[800],
                    fontSize: 30,
                  ),
                ),
                Text(
                  'Alper Topraktepe',
                  style: GoogleFonts.varela(
                    color: Colors.blueGrey[800],
                    fontSize: 15,
                  ),
                ),
                Container(
                  width: 200,
                  child: Divider(
                    height: 15,
                    color: Colors.deepOrangeAccent[100],
                    thickness: 1,
                  ),
                ),
                Card(
                  margin: EdgeInsets.symmetric(horizontal: 50),
                  color: Colors.deepOrangeAccent[100],
                  child: ListTile(
                    onTap: _launchmail,
                    leading: Icon(
                      Icons.email,
                      color: Colors.black,
                    ),
                    title: Text('alpertopraktepe46@gmail.com'),
                  ),
                ),
                SizedBox(height: 10),
                Card(
                  margin: EdgeInsets.symmetric(horizontal: 50),
                  color: Colors.deepOrangeAccent[100],
                  child: ListTile(
                    onTap: _launchtel,
                    leading: Icon(
                      Icons.phone,
                      color: Colors.black,
                    ),
                    title: Text('+90(535) 943 14 12'),
                  ),
                ),
                Container(
                  width: 200,
                  child: Divider(
                      height: 15,
                      color: Colors.deepOrangeAccent[100],
                      thickness: 1),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      tooltip: 'İnstagra',
                      onPressed: _launchiURL,
                      icon: Icon(
                        FontAwesomeIcons.instagram,
                        color: Colors.pink,
                      ),
                      splashColor: Colors.deepOrangeAccent,
                    ),
                    IconButton(
                      tooltip: 'Twitter',
                      onPressed: _launchtURL,
                      icon: Icon(FontAwesomeIcons.twitterSquare),
                      splashColor: Colors.deepOrangeAccent,
                    ),
                    IconButton(
                      tooltip: 'Facebook',
                      onPressed: _launchfURL,
                      icon: Icon(
                        FontAwesomeIcons.facebookSquare,
                        color: Colors.blue,
                      ),
                      splashColor: Colors.deepOrangeAccent,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
