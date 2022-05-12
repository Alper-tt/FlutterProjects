import 'package:flutter/material.dart';

class StoryCard extends StatelessWidget {
  const StoryCard({Key? key, required this.name, required this.assetimage})
      : super(key: key);

  final String name;
  final String assetimage;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(children: <Widget>[
          CircleAvatar(
            radius: 39,
            backgroundImage: AssetImage("assets/story_photos/story_bg.png"),
            child: CircleAvatar(
              radius: 37,
              backgroundImage: AssetImage("assets/story_photos/white_bg.png"),
              child: CircleAvatar(
                radius: 35,
                backgroundImage: AssetImage(assetimage),
              ),
            ),
          ),
        ]),
        Padding(
          padding: EdgeInsets.only(top: 8),
          child: Text(name, overflow: TextOverflow.ellipsis,style: TextStyle(fontSize: 12,),),
        )
      ],
    );
  }
}
