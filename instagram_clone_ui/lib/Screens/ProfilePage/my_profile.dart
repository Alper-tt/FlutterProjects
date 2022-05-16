import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:instagram_clone_ui/widgets/posts/my_profile_posts.dart';
import 'package:instagram_clone_ui/widgets/profile_page/my_highlights.dart';
import 'package:instagram_clone_ui/widgets/profile_page/my_photo.dart';
import 'package:instagram_clone_ui/widgets/profile_page/my_profile_buttons.dart';

import '../../widgets/profile_page/my_tags.dart';

class MyProfilePage extends StatelessWidget {
  const MyProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title: Text(
            "alper.t.t",
            style: TextStyle(color: Colors.black),
          ),
          actions: [
            SvgPicture.asset(
              "assets/add.svg",
              height: 25,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Icon(
                Icons.menu,
                color: Colors.black,
              ),
            )
          ],
        ),
        body: DefaultTabController(
          animationDuration: Duration(seconds: 1),
          length: 2,
          child: NestedScrollView(
            physics: BouncingScrollPhysics(),
            headerSliverBuilder: (context, _) {
              return [
                SliverList(
                    delegate: SliverChildListDelegate(
                        [MyPhoto(), MyProfileButtons(),MyHighlights() ])),
              ];
            },
            body: Column(
              children: [
                Material(
                  color: Colors.white,
                  child: TabBar(
                    labelColor: Colors.black,
                    unselectedLabelColor: Colors.grey.shade400,
                    indicatorWeight: 1,
                    indicatorColor: Colors.black,
                    tabs: [
                      Tab(
                        icon: Image.asset("assets/grid.png"),
                      ),
                      Tab(
                        icon: Image.asset("assets/tag.png"),
                      ),
                    ],
                  ),
                ),
                Expanded(
                    child: TabBarView(children: [MyProfilePosts(), MyTags()]))
              ],
            ),
          ),
        ));
  }
}
