import 'package:flutter/material.dart';
import 'package:instagram_clone_ui/feed/posts/posts.dart';
import 'package:instagram_clone_ui/feed/stories/stories.dart';
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
    List<Widget> postList = Provider.of<Posts>(context).postList;

    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        children: [
          Container(
            color: Colors.white,
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
            children: postList,
          )
        ],
      ),
    );
  }
}