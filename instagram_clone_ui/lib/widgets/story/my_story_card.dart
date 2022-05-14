import 'package:flutter/material.dart';

class MyStoryCard extends StatelessWidget {
  const MyStoryCard({
    Key? key,
    required this.name,
    required this.assetimage,
    required this.addstory,
  }) : super(key: key);

  final String name;
  final String assetimage;
  final String addstory;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: <Widget>[
            CircleAvatar(
              radius: 39,
              backgroundImage: AssetImage("assets/story_photos/white_bg.png"),
              child: CircleAvatar(
                radius: 35,
                backgroundImage: AssetImage(assetimage),
              ),
            ),
            Positioned(
                right: -2,
                bottom: -2,
                child: CircleAvatar(
                  radius: 12,
                  backgroundColor: Colors.white,
                  child: CircleAvatar(
                    radius: 10,
                    backgroundImage: AssetImage(addstory),
                  ),
                ),),
          ],
        ),
        Padding(padding: EdgeInsets.only(top: 8),
        child: Text(name, style: TextStyle(fontSize: 12),),)
      ],
    );
  }
}
