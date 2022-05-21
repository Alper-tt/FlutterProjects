import 'package:flutter/material.dart';

class Post extends StatelessWidget {
  const Post(
      {Key? key,
      required this.personProfilePhoto,
      required this.personName,
      required this.location,
      required this.personPost,
      required this.numberOfLikes,
      required this.timeText,
      required this.personalComment,
      required this.personalCommentIcon})
      : super(key: key);

  final String personProfilePhoto;
  final String personName;
  final String location;
  final String personPost;
  final String numberOfLikes;
  final String timeText;
  final String personalComment;
  final String personalCommentIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.only(bottom: 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 8, top: 2),
                      child: CircleAvatar(
                        backgroundImage:
                            AssetImage("assets/story_photos/story_bg.png"),
                        radius: 20,
                        child: CircleAvatar(
                          backgroundImage:
                              AssetImage("assets/story_photos/white_bg.png"),
                          radius: 18,
                          child: CircleAvatar(
                            backgroundImage: AssetImage(personProfilePhoto),
                            radius: 17,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 5),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            personName,
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 14),
                          ),
                          Text(location,
                              style: TextStyle(
                                  fontWeight: FontWeight.w400, fontSize: 12)),
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(right: 6),
                  child: Icon(Icons.more_horiz),
                )
              ],
            ), //Post Bar

            SizedBox(
              height: 5,
            ),

            Container(
              color: Colors.black,
              padding: EdgeInsets.only(),
              child: SizedBox(
                height: MediaQuery.of(context).size.height / 2.2,
                width: MediaQuery.of(context).size.width,
                child: Image.asset(
                  personPost,
                  fit: BoxFit.contain,
                ),
              ),
            ), // Post photo

            SizedBox(height: 10),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 4),
                        child: Image.asset(
                          "assets/like.png",
                          width: 30,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        child: Image.asset(
                          "assets/comment.png",
                          width: 42,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        child:
                            Image.asset("assets/direct_message.png", width: 34),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 8),
                    child: Image.asset("assets/save-instagram.png", width: 28),
                  )
                ],
              ), // Action buttons bar
            ),

            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(left: 13),
              child: Text(
                '$numberOfLikes likes',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
            ), // number of likes

            SizedBox(height: 5),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: RichText(
                      text: TextSpan(children: [
                    TextSpan(
                      text: personName,
                      style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
                    ),
                    TextSpan(
                      text: "\t$personalComment",
                      style: TextStyle(fontWeight: FontWeight.w400, fontSize: 13),
                    ),
                  ], style: TextStyle(color: Colors.black))
                ))
              ],
            ), // Personal name and explanation

            Padding(
              padding: const EdgeInsets.only(top: 9, left: 14, right: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundImage:
                            AssetImage("assets/story_photos/myprofile.png"),
                        radius: 13,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 8),
                        child: Text(
                          "Add a comment...",
                          style: TextStyle(
                              fontSize: 12, color: Colors.grey.shade500),
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Image.asset(
                        "assets/comment_heart_icon.png",
                        width: 16,
                        height: 16,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5),
                        child: Image.asset(
                          "assets/high_five_icon.png",
                          width: 16,
                          height: 16,
                        ),
                      ),
                      Image.asset(
                        "assets/plus_circle_icon.png",
                        width: 16,
                        height: 16,
                      )
                    ],
                  )
                ],
              ),
            ), // New comment
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 14, top: 9),
                  child: Text(
                    timeText,
                    style: TextStyle(fontSize: 12, color: Colors.grey.shade500),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
