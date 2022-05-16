import 'package:flutter/material.dart';
import 'package:instagram_clone_ui/widgets/profile_page/highlight_Card.dart';

class MyHighlights extends StatelessWidget {
  const MyHighlights({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            HighlightCard(
              assetimage: "assets/story_photos/hl_1.png",
              name: "Setup",
            ),
            HighlightCard(
              assetimage: "assets/story_photos/hl_2.png",
              name: "Netherlands",
            ),
            HighlightCard(
              assetimage: "assets/story_photos/hl_3.png",
              name: "London",
            ),
            HighlightCard(
              assetimage: "assets/story_photos/hl_4.png",
              name: "Paris",
            ),
            HighlightCard(
              assetimage: "assets/story_photos/hl_5.png",
              name: "New York",
            ),
            HighlightCard(
              assetimage: "assets/story_photos/hl_6.png",
              name: "New",
            ),
          ],
        ),
      ),
    );
  }
}
