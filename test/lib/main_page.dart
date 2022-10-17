import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: TextButton(
          child: Text(
            "A",
            style: TextStyle(
              fontSize: 23,
              color: Colors.black,
            ),
          ),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.segment,
              color: Colors.black,
            ),
            style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.white)),
          )
        ],
        backgroundColor: Colors.white,
        shadowColor: Colors.transparent,
        title: Text(
          "Account",
          style: TextStyle(color: Colors.black, fontSize: 16),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 60),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: const TextSpan(children: [
                        TextSpan(
                            text: "Good Morning,",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 25,
                                fontWeight: FontWeight.w300)),
                        TextSpan(
                            text: "\nAlper",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 26,
                                fontWeight: FontWeight.w400)),
                      ]),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        RichText(
                            text: TextSpan(
                          children: [
                            TextSpan(
                                text: "CURRENT BALANCE",
                                style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold)),
                            TextSpan(
                                text: "\n2,532.67",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 255, 225, 0),
                                    fontSize: 30,
                                    fontWeight: FontWeight.w400))
                          ],
                        )),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Column(
                            children: [
                              Text("USD",
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 255, 225, 0),
                                      fontSize: 17,
                                      fontWeight: FontWeight.w400))
                            ],
                          ),
                        ),
                        IconButton(
                          padding: EdgeInsets.only(top: 22),
                          onPressed: () {},
                          icon: Icon(Icons.expand_more_rounded),
                          color: Colors.black45,
                        )
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
          DefaultTabController(
            length: 3,
            child: Column(
              children: [
                Material(
                  color: Colors.white,
                  child: TabBar(
                    unselectedLabelStyle:
                        TextStyle(fontWeight: FontWeight.w500),
                    labelColor: Colors.black,
                    labelStyle: TextStyle(fontWeight: FontWeight.bold),
                    unselectedLabelColor: Colors.grey.shade500,
                    indicatorWeight: 1,
                    indicatorColor: Color.fromARGB(255, 255, 225, 0),
                    tabs: [
                      Tab(
                        text: "Statement",
                      ),
                      Tab(
                        text: "Spends",
                      ),
                      Tab(text: "Income")
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
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
          });
        },
      ),
    );
  }
}
