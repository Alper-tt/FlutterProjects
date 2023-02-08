import 'package:flutter/material.dart';
import 'package:test/screens/card_screen.dart';
import 'package:test/screens/hello_screen.dart';

import '../widgets/overview.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

PageController? _pageController;

class _MainPageState extends State<MainPage> {
  @override
  void initState() {
    _pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    _pageController?.dispose();
    super.dispose();
  }

  int selectedIndex = 0;
  final List<Widget> _widget = [
    OverView(),
    CardPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: PageView(
        children: _widget,
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        elevation: 0,
        backgroundColor: Colors.white,
        selectedIconTheme: IconThemeData(size: 35),
        iconSize: 30,
        unselectedItemColor: Colors.grey.shade500,
        currentIndex: selectedIndex,
        selectedItemColor: Color.fromARGB(255, 255, 225, 0),
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: ""),
          BottomNavigationBarItem(
              icon: Icon(Icons.credit_card_outlined), label: ""),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.add_circle_rounded,
                color: Color.fromARGB(255, 255, 225, 0),
                size: 50,
              ),
              label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.chat_outlined), label: ""),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings_outlined), label: ""),
        ],
        onTap: (index) {
          setState(() {
            selectedIndex = index;
            _pageController?.animateToPage(index,
                duration: Duration(milliseconds: 500), curve: Curves.linear);
          });
        },
      ),
    );
  }
}
