import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ReelsContent extends StatefulWidget {
  const ReelsContent(
      {Key? key,
      required this.favNumbers,
      required this.commentNumbers,
      required this.profileImage,
      required this.profileName,
      required this.personalComment,
      required this.music})
      : super(key: key);

  final String favNumbers;
  final String commentNumbers;
  final String profileImage;
  final String profileName;
  final String personalComment;
  final String music;

  @override
  State<ReelsContent> createState() => _ReelsContentState();
}

bool followed = false;

class _ReelsContentState extends State<ReelsContent> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        children: [
          Expanded(
            flex: 5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(right: 8),
                            child: CircleAvatar(
                              backgroundImage: AssetImage(widget.profileImage),
                              radius: 22,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 10),
                            child: Text(
                              widget.profileName,
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white),
                            ),
                          ),
                          OutlinedButton(
                            onPressed: () {
                              setState(() {
                                followed = !followed;
                              });
                            },
                            child: Text(followed ? "Following" : "Follow",
                                style: TextStyle(color: Colors.white)),
                            style: OutlinedButton.styleFrom(
                              side: BorderSide(color: Colors.white, width: 0.8),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 10,horizontal: 5),
                        child: Row(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width/1.4,
                              child: Text(
                                widget.personalComment,
                                style: TextStyle(color: Colors.white),
                              ),
                            )
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.music_note,
                            color: Colors.white,
                            size: 20,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            widget.music,
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
              flex: 1,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 22),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Icon(
                          Icons.camera_alt_outlined,
                          size: 28,
                          color: Colors.white,
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: Column(
                            children: [
                              SvgPicture.asset(
                                "assets/like.svg",
                                color: Colors.white,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                widget.favNumbers,
                                style: TextStyle(color: Colors.white),
                              )
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: Column(
                            children: [
                              SvgPicture.asset(
                                "assets/comment.svg",
                                color: Colors.white,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                widget.commentNumbers,
                                style: TextStyle(color: Colors.white),
                              )
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: Column(
                            children: [
                              SvgPicture.asset(
                                "assets/share.svg",
                                color: Colors.white,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                            ],
                          ),
                        ),
                        Icon(
                          Icons.more_horiz,
                          color: Colors.white,
                          size: 30,
                        ),
                        SizedBox(height: 10,),
                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.white, width: 2),
                              color: Colors.white,
                              image: DecorationImage(
                                image: AssetImage(
                                    widget.profileImage),
                                fit: BoxFit.cover,
                              ),
                              borderRadius: BorderRadius.circular(15)),
                        )
                      ],
                    )
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
