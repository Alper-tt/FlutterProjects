import 'package:flutter/material.dart';

class HighlightCard extends StatelessWidget {
  const HighlightCard({Key? key, required this.name, required this.assetimage})
      : super(key: key);

  final String name;
  final String assetimage;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        children: [
          Stack(children: <Widget>[
            CircleAvatar(
              radius: 34,
              backgroundImage: AssetImage("assets/story_photos/white_bg.png"),
              child: CircleAvatar(
                radius: 32,
                backgroundImage: AssetImage(assetimage),
              ),
            ),
          ]),
          Padding(
            padding: EdgeInsets.only(top: 5),
            child: Text(
              name,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 12,
              ),
            ),
          )
        ],
      ),
    );
  }
}
