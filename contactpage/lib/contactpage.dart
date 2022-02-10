import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(
    BenimUyg(),
  );
}

class BenimUyg extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
                    child: Divider(height: 15, color: Colors.deepOrangeAccent[100],thickness: 1,),),
                Card(
                  margin: EdgeInsets.symmetric(horizontal: 50),
                  color: Colors.deepOrangeAccent[100],
                  child: ListTile(leading:
                      Icon(
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
                    leading: Icon(
                      Icons.phone,
                      color: Colors.black,
                    ),
                    title: Text('+90(535) 943 14 12'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
/*
decoration: BoxDecoration(
shape: BoxShape.rectangle,
borderRadius: BorderRadius.circular(20),
color: Colors.deepOrangeAccent[100],
),
margin: EdgeInsets.all(10),
width: 250,
height: 40,
child: Center(
child: Text('alpertopraktepe46@gmail.com'),
),
),
Container(
decoration: BoxDecoration(
shape: BoxShape.rectangle,
borderRadius: BorderRadiusDirectional.circular(20),
color: Colors.deepOrangeAccent[100],
),
width: 250,
height: 40,
child: Center(
child: Text('+90(535) 943 14 12'),
),
),
*/
