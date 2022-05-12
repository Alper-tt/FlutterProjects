import 'package:flutter/material.dart';

import '../../../widgets/story/my_story_card.dart';
import '../../../widgets/story/story_card.dart';

class Story with ChangeNotifier {
  List<Widget> storyList = [
    MyStoryCard(
        name: "Your Story",
        assetimage: "assets/story_photos/myprofile.png",
        addstory: "assets/addstory.png"),
    StoryCard(name: "1ibrahimsana", assetimage: "assets/story_photos/ibrahim.png"),
    StoryCard(name: "kayaaaliican", assetimage: "assets/story_photos/alican.png"),
    StoryCard(name: "arda.t.t", assetimage: "assets/story_photos/arda.png"),
    StoryCard(name: "berk.ssqw", assetimage: "assets/story_photos/berk.png"),
    StoryCard(name: "burcusanaa", assetimage: "assets/story_photos/burcu.png"),
    StoryCard(name: "brtsana", assetimage: "assets/story_photos/berat.png"),
    StoryCard(name: "kavvasoglujo...", assetimage: "assets/story_photos/yusuf.png"),
    StoryCard(name: "erkeklerin...", assetimage: "assets/story_photos/erkek.png"),
  ];


}
