import 'package:flutter/material.dart';
import 'package:instagram_clone_ui/feed/stories/stories.dart';
import 'package:instagram_clone_ui/widgets/posts/home_posts.dart';
import 'package:provider/provider.dart';

class PostPage extends StatefulWidget {
  const PostPage({Key? key}) : super(key: key);

  @override
  _PostPageState createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  @override
  Widget build(BuildContext context) {
    List<Widget> storyList = Provider.of<Story>(context).storyList;
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
          Column(
            children: [
              Posts(
                  personProfilePhoto: "assets/story_photos/myprofile.png",
                  personName: "Alper.t.t",
                  location: "Netherlands",
                  personPost: "assets/post_photos/mypost.png",
                  numberOfLikes: "8235",
                  timeText: "25 minutes ago",
                  personalComment: "New country; new life 🌆",
                  personalCommentIcon: "assets/story_photos/myprofile.png")
            ],
          )
        ],
      ),
    );
  }
}
