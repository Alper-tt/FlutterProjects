import 'package:flutter/material.dart';
import 'package:instagram_clone_ui/widgets/story/my_story_card.dart';
import 'package:instagram_clone_ui/widgets/story/story_card.dart';

class PostPage extends StatefulWidget {
  const PostPage({Key? key}) : super(key: key);

  @override
  _PostPageState createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  List<Widget> storyList = [
    MyStoryCard(
        name: "Your Story",
        assetimage: "assets/myprofile.png",
        addstory: "assets/addstory.png"),
    StoryCard(name: "1ibrahimsana", assetimage: "assets/ibrahim.png"),
    StoryCard(name: "kayaaaliican", assetimage: "assets/alican.png"),
    StoryCard(name: "arda.t.t", assetimage: "assets/arda.png"),
    StoryCard(name: "berk.ssqw", assetimage: "assets/berk.png"),
    StoryCard(name: "burcusanaa", assetimage: "assets/burcu.png"),
    StoryCard(name: "brtsana", assetimage: "assets/berat.png"),
    StoryCard(name: "kavvasoglujo...", assetimage: "assets/yusuf.png"),
    StoryCard(name: "erkeklerin...", assetimage: "assets/erkek.png"),
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Divider(),
          Container(
            height: MediaQuery.of(context).size.height * 0.14,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2),
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: storyList.length,
                separatorBuilder: (BuildContext context, index) {
                  return SizedBox(
                    width: 10,
                  );
                },
                itemBuilder: (context, index) {
                  return storyList[index];
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
