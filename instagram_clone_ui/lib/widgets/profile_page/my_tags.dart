import 'package:flutter/material.dart';

class MyTags extends StatelessWidget {
  const MyTags({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
     Size size=MediaQuery.of(context).size;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset('assets/tag1.png',
          height:size.height*0.18,
        width: size.width*0.18),
        const Text("Photos and videos of you",
          style: TextStyle(
              fontWeight: FontWeight.bold,
          fontSize: 26)),
        const Padding(
          padding: EdgeInsets.only(right: 20,left:20,top: 20),
          child: Text(
              "When people tag you in photos and videos, they\'ll appear here.",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey,
                  fontWeight: FontWeight.normal,
                  fontSize: 18)),
        ),

      ],
    );
  }
}