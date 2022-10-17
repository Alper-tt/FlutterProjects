import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:instagram_clone_ui/Screens/HomePage/posts_page.dart';
import 'package:instagram_clone_ui/Screens/MessagePage/message_page.dart';
import 'package:page_transition/page_transition.dart';

class StoryProfile extends StatefulWidget {
  const StoryProfile({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<StoryProfile> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onHorizontalDragEnd: (_) {
          setState(() {
            Navigator.push(
                context,
                PageTransition(
                    child: MessagePage(),
                    type: PageTransitionType.rightToLeftJoined,
                    childCurrent: this.widget));
          });
        
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: Container(
            decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: Colors.white))),
            child: AppBar(
              elevation: 0,
              backgroundColor: Colors.white,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 8),
                    child: Image.asset(
                      "assets/instagram.png",
                      fit: BoxFit.cover,
                      height: size.height * 0.06,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SvgPicture.asset(
                            "assets/add.svg",
                            fit: BoxFit.cover,
                            height: size.height * 0.03,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SvgPicture.asset("assets/like.svg",
                              fit: BoxFit.cover, height: size.height * 0.03),
                        ),
                        IconButton(
                          onPressed: (() {
                            setState(() {
                              Navigator.push(
                                  context,
                                  PageTransition(
                                      child: MessagePage(),
                                      type:
                                          PageTransitionType.rightToLeftJoined,
                                      childCurrent: this.widget));
                            });
                          }),
                          icon: SvgPicture.asset("assets/messenger.svg",
                              fit: BoxFit.cover, height: size.height * 0.03),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        body: PostPage(),
      ),
    );
  }
}
