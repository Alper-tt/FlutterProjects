import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyPhoto extends StatelessWidget {
  const MyPhoto({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.only(right: 15,left: 15,top: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              children: [CircleAvatar(
                radius: 44,
                backgroundImage: AssetImage('assets/story_photos/white_bg.png'),
                child: CircleAvatar(
                  radius: 42,
                  backgroundImage: AssetImage('assets/story_photos/myprofile.png'),
                ),
              ),
                Positioned(
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 14,
                    child: CircleAvatar(
                      radius: 12,
                      child: Image.asset("assets/addstory.png"),
                    ),
                  ),
                  bottom: 0,
                  right: -2,
                )
              ],
            ),
            Row(
              children: [
                Column(
                  children: [
                    Text(
                      "6",
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    Text(
                      "Posts",
                      style: TextStyle(fontSize: 16),
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      Text(
                        "303",
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                      Text(
                        "Followers",
                        style: TextStyle(fontSize: 16),
                      )
                    ],
                  ),
                ),
                Column(
                  children: [
                    Text(
                      "294",
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    Text(
                      "Following",
                      style: TextStyle(fontSize: 16),
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
