import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import 'home_posts.dart';

class MyProfilePosts extends StatelessWidget {
  const MyProfilePosts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: 6,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 3,
          mainAxisSpacing: 4,
          childAspectRatio: 1),
      itemBuilder: (context, index) {
        return GridTile(
            child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      PageTransition(
                          child: SafeArea(
                            child: Scaffold(
                              appBar: AppBar(
                                foregroundColor: Colors.black,
                                backgroundColor: Colors.white,
                                elevation: 0,
                                title: Text(
                                  "Posts",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                              ),
                              body: Post(
                                  personProfilePhoto:
                                      "assets/story_photos/myprofile.png",
                                  personName: "alper.t.t",
                                  location: "Netherlands",
                                  personPost:
                                      "assets/my_posts/post_${index + 1}.png",
                                  numberOfLikes: "142",
                                  timeText: "25 minutes ago",
                                  personalComment:
                                      '"Everyone gonna die and no one is gonna remember you, so fuck it!"',
                                  personalCommentIcon:
                                      "assets/story_photos/myprofile.png"),
                            ),
                          ),
                          type: PageTransitionType.rightToLeft));
                },
                child: Image.asset("assets/my_posts/post_${index + 1}.png")));
      },
    );
  }
}
