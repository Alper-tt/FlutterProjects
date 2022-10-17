import 'package:flutter/material.dart';
import 'package:instagram_clone_ui/Screens/HomePage/home_page.dart';
import 'package:instagram_clone_ui/Screens/MessagePage/my_messages.dart';
import 'package:instagram_clone_ui/widgets/SearchBar/search_bar.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class MessagePage extends StatelessWidget {
  const MessagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List messageList = Provider.of<Messages>(context).messageList;
    return GestureDetector(
      onHorizontalDragEnd: (details) {
        Navigator.pop(context, PageTransition(
          child: HomePage(),
          type: PageTransitionType.leftToRightJoined,
          childCurrent: this
        ));
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Row(
            children: [
              Text(
                "alper.t.t",
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Icon(
                  Icons.keyboard_arrow_down_rounded,
                  color: Colors.black,
                ),
              )
            ],
          ),
          leading: BackButton(
            color: Colors.black,
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          actions: [
            Icon(
              Icons.video_call_outlined,
              color: Colors.black,
              size: 30,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Icon(Icons.add_rounded, color: Colors.black, size: 30),
            )
          ],
        ),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: SearchBar(title: "Search"),
                ),
                Padding(
                  padding: EdgeInsets.all(14),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Messages",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w500),
                      ),
                      Text(
                        "Requests",
                        style: TextStyle(color: Colors.lightBlue),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 14),
                  child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    itemCount: messageList.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return messageList[index];
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
