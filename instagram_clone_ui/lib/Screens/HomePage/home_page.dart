import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:instagram_clone_ui/Screens/HomePage/story_profile.dart';
import 'package:instagram_clone_ui/Screens/ProfilePage/my_profile.dart';
import 'package:instagram_clone_ui/Screens/ReelsPage/reels_page.dart';
import 'package:instagram_clone_ui/Screens/SearchPage/search_page.dart';
import 'package:instagram_clone_ui/Screens/StorePage/store_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  static final List<Widget> _widget = [
    const StoryProfile(),
    SearchPage(),
    ReelsPage(),
    StorePage(),
    MyProfilePage()
  ];

  void _onTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _widget.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/home.svg",
              height: 24,
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                "assets/search.svg",
                height: 24,
              ),
              label: "Search"),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                "assets/reels.svg",
                height: 24,
              ),
              label: "Reels"),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                "assets/shop.svg",
                height: 24,
              ),
              label: "Store"),
          BottomNavigationBarItem(
              icon: CircleAvatar(
                radius: 13,
                backgroundImage:
                    AssetImage("assets/story_photos/myprofile.png"),
                backgroundColor: Colors.black,
              ),
              label: "Profile")
        ],
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: Colors.black,
        backgroundColor: Colors.white,
        unselectedItemColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        elevation: 5,
        onTap: _onTap,
        iconSize: 30,
      ),
    );
  }
}
